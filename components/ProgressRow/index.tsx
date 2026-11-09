import React from "react";
import { View, Text } from "react-native";
import { style } from "./styles";

type Props = {
    nome: string,
    acertos: number,
    total: number
}

export function ProgressRow({ nome, acertos, total }: Props){
    const porcentagem = total > 0 ? Math.round((acertos / total) * 100) : 0

    return(
        <View style={style.card}>
            <View style={style.row}>
                <Text style={style.nome}>{nome}</Text>
                <Text style={style.acertos}>{acertos}/{total} acertos</Text>
            </View>

            <View style={style.track}>
                <View style={[style.fill, { width: `${porcentagem}%` }]} />
            </View>
        </View>
    )
}
