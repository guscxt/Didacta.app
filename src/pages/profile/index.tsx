import React from "react";
import { View, Text } from "react-native";
import { Ionicons } from '@expo/vector-icons'

import { style } from "./styles"
import { themas } from "../../global/themes"
import { Usuario } from "../../global/types"
import { Header } from "../../../components/Header"
import { Button } from "../../../components/Button"

type Props = {
    usuario: Usuario,
    onLogout: () => void
}

export default function Profile({ usuario, onLogout }: Props) {
    return (
        <View style={style.container}>

            <Header title="Perfil" subtitle="Seus dados de acesso" />

            <View style={style.body}>

                <View style={style.card}>
                    <Text style={style.label}>Nome</Text>
                    <Text style={style.value}>{usuario.nome}</Text>

                    <Text style={style.label}>E-mail</Text>
                    <Text style={style.value}>{usuario.email}</Text>

                    <Text style={style.label}>Tipo de conta</Text>
                    <Text style={style.value}>{usuario.papel === 'administrador' ? 'Administrador' : 'Aluno'}</Text>
                </View>

                <Button
                    text="Sair"
                    variant="outline"
                    onPress={onLogout}
                    icon={<Ionicons name="log-out-outline" size={18} color={themas.colors.gray} />}
                />

            </View>
        </View>
    )
}
