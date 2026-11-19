import React from "react";
import { View, Text, TouchableOpacity } from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { themas } from "../../src/global/themes";
import { style } from "./styles";

const COR_CORRETA = themas.colors.primary
const COR_ERRADA = '#dc2626'

type Props = {
    correta: boolean,
    resolucao: string,
    ultima: boolean,
    onRefazer: () => void,
    onProxima: () => void
}

export function FeedbackCard({ correta, resolucao, ultima, onRefazer, onProxima }: Props){
    return(
        <View style={[style.card, correta ? style.cardCorreta : style.cardErrada]}>

            <View style={style.titulo}>
                <Ionicons
                    name={correta ? "checkmark" : "close"}
                    size={20}
                    color={correta ? COR_CORRETA : COR_ERRADA}
                />
                <Text style={[style.tituloTexto, correta ? style.corCorreta : style.corErrada]}>
                    {correta ? 'Correto! 🎉' : 'Quase lá!'}
                </Text>
            </View>

            <Text style={style.resolucao}>{resolucao}</Text>

            <View style={style.botoes}>
                {!correta && (
                    <TouchableOpacity style={style.botaoRefazer} onPress={onRefazer} activeOpacity={0.7}>
                        <Ionicons name="refresh" size={18} color={COR_ERRADA} />
                        <Text style={style.botaoRefazerTexto}>Refazer</Text>
                    </TouchableOpacity>
                )}

                <TouchableOpacity style={style.botaoProxima} onPress={onProxima} activeOpacity={0.7}>
                    <Text style={style.botaoProximaTexto}>{ultima ? 'Finalizar' : 'Próxima'}</Text>
                    <Ionicons name="chevron-forward" size={18} color="#ffffff" />
                </TouchableOpacity>
            </View>

        </View>
    )
}
