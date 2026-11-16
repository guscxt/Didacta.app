import React from "react";
import { View, Text, TouchableOpacity } from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { themas } from "../../src/global/themes";
import { Nivel } from "../../src/global/types";
import { style } from "./styles";

type Props = {
    simbolo: string,
    titulo: string,
    aberta: boolean,
    niveis: Nivel[],
    onPress: () => void,
    onSelectNivel: (nivel: Nivel) => void
}

export function AreaItem({ simbolo, titulo, aberta, niveis, onPress, onSelectNivel }: Props){
    return(
        <View style={style.card}>

            <TouchableOpacity style={style.row} onPress={onPress} activeOpacity={0.7}>
                <View style={style.circle}>
                    <Text style={style.simbolo}>{simbolo}</Text>
                </View>

                <Text style={style.titulo}>{titulo}</Text>

                <Ionicons
                    name={aberta ? "chevron-down" : "chevron-forward"}
                    size={20}
                    color={themas.colors.textMuted}
                />
            </TouchableOpacity>

            {aberta && (
                <View style={style.painel}>
                    <Text style={style.painelTitulo}>Escolha o nível de dificuldade</Text>

                    <View style={style.niveis}>
                        {niveis.map(nivel => (
                            <TouchableOpacity
                                key={nivel.id}
                                style={[style.nivel, { backgroundColor: nivel.fundo, borderColor: nivel.cor }]}
                                onPress={() => onSelectNivel(nivel)}
                                activeOpacity={0.7}
                            >
                                <Text style={[style.nivelTexto, { color: nivel.cor }]}>{nivel.nome}</Text>
                            </TouchableOpacity>
                        ))}
                    </View>
                </View>
            )}

        </View>
    )
}
