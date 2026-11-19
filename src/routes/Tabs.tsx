import React from "react";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { Ionicons } from '@expo/vector-icons'

import { themas } from "../global/themes"
import { Usuario } from "../global/types"
import Home from "../pages/home"
import StudyStack from "./StudyStack"
import Profile from "../pages/profile"

const Tab = createBottomTabNavigator();

type IconName = React.ComponentProps<typeof Ionicons>['name']

const ICONES: Record<string, { ativo: IconName, inativo: IconName }> = {
    'Início': { ativo: 'home', inativo: 'home-outline' },
    'Estudar': { ativo: 'book', inativo: 'book-outline' },
    'Perfil': { ativo: 'person', inativo: 'person-outline' },
}

type Props = {
    usuario: Usuario,
    onLogout: () => void
}

export default function Tabs({ usuario, onLogout }: Props) {
    return (
        <Tab.Navigator
            initialRouteName="Início"
            screenOptions={({ route }) => ({
                headerShown: false,
                tabBarActiveTintColor: themas.colors.primary,
                tabBarInactiveTintColor: themas.colors.textMuted,
                tabBarLabelStyle: { fontSize: 11, fontWeight: '600' },
                tabBarStyle: {
                    backgroundColor: themas.colors.card,
                    borderTopColor: themas.colors.border,
                },
                tabBarIcon: ({ focused, color, size }) => {
                    const icone = ICONES[route.name]
                    return <Ionicons name={focused ? icone.ativo : icone.inativo} size={size} color={color} />
                },
            })}
        >
            <Tab.Screen name="Início" component={Home} />
            <Tab.Screen name="Estudar" component={StudyStack} />
            <Tab.Screen name="Perfil">
                {() => <Profile usuario={usuario} onLogout={onLogout} />}
            </Tab.Screen>
        </Tab.Navigator>
    )
}
