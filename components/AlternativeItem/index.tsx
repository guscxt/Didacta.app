import React from "react";
import { Text, View, TouchableOpacity } from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { style } from "./styles";

export type EstadoAlternativa = 'normal' | 'selecionada' | 'correta' | 'errada' | 'neutra'

type Props = {
    letra: string,
    texto: string,
    estado: EstadoAlternativa,
    desabilitada?: boolean,
    onPress: () => void
}

export function AlternativeItem({ letra, texto, estado, desabilitada, onPress }: Props){
    const cards = {
        normal: null,
        selecionada: style.cardSelecionada,
        correta: style.cardCorreta,
        errada: style.cardErrada,
        neutra: null,
    }
    const circulos = {
        normal: null,
        selecionada: style.circuloSelecionada,
        correta: style.circuloCorreta,
        errada: style.circuloErrada,
        neutra: null,
    }
    const letras = {
        normal: null,
        selecionada: style.letraSelecionada,
        correta: null,
        errada: null,
        neutra: style.letraNeutra,
    }
    const textos = {
        normal: null,
        selecionada: style.textoSelecionada,
        correta: style.textoCorreta,
        errada: style.textoErrada,
        neutra: style.textoNeutra,
    }

    return(
        <TouchableOpacity
            style={[style.card, cards[estado]]}
            onPress={onPress}
            disabled={desabilitada}
            activeOpacity={0.7}
        >
            <View style={[style.circulo, circulos[estado]]}>
                {estado === 'correta' ? (
                    <Ionicons name="checkmark" size={16} color="#ffffff" />
                ) : estado === 'errada' ? (
                    <Ionicons name="close" size={16} color="#ffffff" />
                ) : (
                    <Text style={[style.letra, letras[estado]]}>{letra}</Text>
                )}
            </View>

            <Text style={[style.texto, textos[estado]]}>{texto}</Text>
        </TouchableOpacity>
    )
}
