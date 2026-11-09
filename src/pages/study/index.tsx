import React from "react";
import { View, Text } from "react-native";

import { style } from "./styles"
import { Header } from "../../../components/Header"

export default function Study() {
    return (
        <View style={style.container}>

            <Header title="Áreas da Matemática" />

            <View style={style.body}>
                <Text style={style.text}>Em breve: a lista de conteúdos vai aparecer aqui.</Text>
            </View>

        </View>
    )
}
