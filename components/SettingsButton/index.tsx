import React from "react";
import { TouchableOpacity, TouchableOpacityProps } from "react-native";
import { Ionicons } from '@expo/vector-icons'
import { style } from "./styles";

export function SettingsButton(props: TouchableOpacityProps){
    return(
        <TouchableOpacity style={style.button} activeOpacity={0.6} {...props}>
            <Ionicons name="settings-sharp" size={22} color="rgba(255,255,255,0.75)" />
        </TouchableOpacity>
    )
}
