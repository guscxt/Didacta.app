import React from "react";
import { View, Text } from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { style } from "./styles";

type Props = {
    icon: React.ComponentProps<typeof Ionicons>['name'],
    color: string,
    value: string,
    label: string
}

export function StatCard({ icon, color, value, label }: Props){
    return(
        <View style={style.card}>
            <Ionicons name={icon} size={22} color={color} />
            <Text style={style.value}>{value}</Text>
            <Text style={style.label}>{label}</Text>
        </View>
    )
}
