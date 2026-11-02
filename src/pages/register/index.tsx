import React, { useState } from "react";

import {
    Text,
    View,
    Image,
    ScrollView,
    Alert
} from 'react-native';

import { style } from "./styles"
import Logo from '../../assets/logo.png'
import { Octicons } from '@expo/vector-icons'
import { registrar } from "../../services/api"
import { Input } from "../../../components/Input"
import { Button } from "../../../components/Button"
import { SettingsButton } from "../../../components/SettingsButton"

type Props = {
    onGoToLogin: () => void
}

export default function Register({ onGoToLogin }: Props) {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [showPassword, setShowPassword] = useState(true);
    const [showConfirmPassword, setShowConfirmPassword] = useState(true);
    const [loading, setLoading] = useState(false)

    async function getRegister(){

        if(!name.trim() || !email.trim() || !password || !confirmPassword){
            return Alert.alert('Atenção', 'Preencha todos os campos!')
        }

        if(password.length < 6){
            return Alert.alert('Atenção', 'A senha deve ter pelo menos 6 caracteres.')
        }

        if(password !== confirmPassword){
            return Alert.alert('Atenção', 'As senhas não conferem!')
        }

        try {
            setLoading(true)

            await registrar(name.trim(), email.trim().toLowerCase(), password)

            Alert.alert('Cadastro realizado!', 'Agora é só fazer login.', [
                { text: 'OK', onPress: onGoToLogin }
            ])

        } catch (error) {
            const mensagem = error instanceof Error ? error.message : 'Erro ao conectar com o servidor.'
            Alert.alert('Erro!', mensagem)
        } finally {
            setLoading(false)
        }
    }


    return (
        <View style={style.container}>

            <View style={style.boxTop}>

                <SettingsButton />

                <Image
                    source={Logo}
                    style={style.logo}
                    resizeMode="contain"
                />
                <Text style={style.text}>Criar conta</Text>
            </View>

            <ScrollView
                style={style.boxMid}
                contentContainerStyle={style.boxMidContent}
                keyboardShouldPersistTaps="handled"
            >
                <Input
                    value={name}
                    onChangeText={setName}
                    title="Nome"
                    autoCapitalize="words"
                />
                <Input
                    value={email}
                    onChangeText={setEmail}
                    title="E-mail"
                    autoCapitalize="none"
                    keyboardType="email-address"
                />
                <Input
                    value={password}
                    onChangeText={setPassword}
                    title="Senha"
                    IconRight={Octicons}
                    iconRightName={showPassword?"eye-closed":"eye"}
                    secureTextEntry={showPassword}
                    onIconRightPress={()=>setShowPassword(!showPassword)}
                />
                <Input
                    value={confirmPassword}
                    onChangeText={setConfirmPassword}
                    title="Repetir senha"
                    IconRight={Octicons}
                    iconRightName={showConfirmPassword?"eye-closed":"eye"}
                    secureTextEntry={showConfirmPassword}
                    onIconRightPress={()=>setShowConfirmPassword(!showConfirmPassword)}
                />

                <View style={style.boxBottom}>

                    <Button
                        text="Cadastrar"
                        loading={loading}
                        disabled={loading}
                        onPress={()=>getRegister()}
                    />

                    <Text style={style.textBottom}>Já tem conta?  <Text style={style.textBottomCreate} onPress={onGoToLogin}>Entrar</Text></Text>

                </View>

            </ScrollView>
        </View>
    )
}
