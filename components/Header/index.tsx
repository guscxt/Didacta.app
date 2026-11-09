import React from "react";
import { View, Text, TouchableOpacity } from "react-native";
import { StatusBar } from "expo-status-bar";
import { LinearGradient } from "expo-linear-gradient";
import { Ionicons } from "@expo/vector-icons";
import { useSafeAreaInsets } from "react-native-safe-area-context";
import { themas } from "../../src/global/themes";
import { style } from "./styles";

type Props = {
    title: string,
    subtitle?: string,
    onBack?: () => void
}

export function Header({ title, subtitle, onBack }: Props){
    // O app desenha por baixo da barra de status, então o topo precisa de um respiro extra
    const insets = useSafeAreaInsets()

    return(
        <LinearGradient
            colors={[themas.colors.primaryDark, themas.colors.primary]}
            start={{ x: 0, y: 0 }}
            end={{ x: 1, y: 1 }}
            style={[style.container, { paddingTop: insets.top + 20 }]}
        >
            <StatusBar style="light" />

            <View style={style.row}>
                {onBack && (
                    <TouchableOpacity onPress={onBack} style={style.back} hitSlop={{ top: 10, bottom: 10, left: 10, right: 10 }}>
                        <Ionicons name="arrow-back" size={24} color="#ffffff" />
                    </TouchableOpacity>
                )}

                <View>
                    <Text style={style.title}>{title}</Text>
                    {subtitle ? <Text style={style.subtitle}>{subtitle}</Text> : null}
                </View>
            </View>
        </LinearGradient>
    )
}
