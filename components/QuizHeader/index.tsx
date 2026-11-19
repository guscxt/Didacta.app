import React from "react";
import { View, Text, TouchableOpacity } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Ionicons } from "@expo/vector-icons";
import { useSafeAreaInsets } from "react-native-safe-area-context";
import { themas } from "../../src/global/themes";
import { style } from "./styles";

type Props = {
    atual: number,
    total: number,
    onClose: () => void
}

export function QuizHeader({ atual, total, onClose }: Props){
    const insets = useSafeAreaInsets()
    const porcentagem = total > 0 ? Math.min(100, (atual / total) * 100) : 0

    return(
        <View style={[style.container, { paddingTop: insets.top + 12 }]}>
            <StatusBar style="dark" />

            <TouchableOpacity onPress={onClose} hitSlop={{ top: 10, bottom: 10, left: 10, right: 10 }}>
                <Ionicons name="close" size={26} color={themas.colors.textMuted} />
            </TouchableOpacity>

            <View style={style.track}>
                <View style={[style.fill, { width: `${porcentagem}%` }]} />
            </View>

            <Text style={style.contador}>{atual}/{total}</Text>
        </View>
    )
}
