import React, { useState } from "react";

import {
    Text,
    View,
    Image,
    TextInput,
    TouchableOpacity,
    Alert
} from 'react-native';

import { style } from "./styles"
import Logo from '../../assets/logo.png'
import { Ionicons, Octicons } from '@expo/vector-icons'
import { MaterialIcons } from '@expo/vector-icons'
import { themas } from "../../global/themes"
import { LinearGradient } from 'expo-linear-gradient';
import { login } from "../../services/api"
import { Input } from "../../../components/Input"
import { Button } from "../../../components/Button"
import { SettingsButton } from "../../../components/SettingsButton"

type Props = {
    onGoToRegister: () => void
}

export default function Login({ onGoToRegister }: Props) {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [showPassword, setShowPassoword] = useState(true);
    const [loading, setLoading] = useState(false)

    async function getLogin(){
        
        try {

            if(!email || !password){
                return Alert.alert('Atenção', 'Informe os dados obrigatórios!')
            }

            const resposta = await login(email.trim().toLowerCase(), password)

            Alert.alert('Logado com sucesso!', `Bem-vindo, ${resposta.usuario.nome}`)
            
        } catch (error) {
            const mensagem = error instanceof Error ? error.message : 'Erro ao conectar com o servidor.'
            Alert.alert('Erro!', mensagem)
        }
    }

    
    return (
        <View style={style.container}>

            <View style={style.boxTop}>
    
                <Image
                    source={Logo}
                    style={style.logo}
                    resizeMode="contain"
                />
                <Text style={style.text}>Acesso ao sistema</Text>
            </View>

            <View style={style.boxMid}>
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
                    onIconRightPress={()=>setShowPassoword(!showPassword)}
                />

                <View style={style.boxBottom}>

                    <Button
                        text="Entrar"
                        loading={loading}
                        onPress={()=>getLogin()}
                    />

                    <Text style={style.textBottom}>Não tem conta?  <Text style={style.textBottomCreate} onPress={onGoToRegister}>Cadastrar-se</Text></Text>

                </View>

                <View style={style.boxAdm}>

                    <View style={style.divider} />

                    <Button 
                        text="Acesso Administrador"
                        variant="outline"
                        icon={<Ionicons name="shield-outline" size={18} color={themas.colors.gray} />}
                    />

                </View>

            </View>
        </View>
    )
}