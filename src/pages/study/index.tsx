import React, { useState } from "react";
import { View, Text, ScrollView, Alert, LayoutAnimation } from "react-native";
import { BottomTabScreenProps } from "@react-navigation/bottom-tabs";
import { ParamListBase } from "@react-navigation/native";

import { style } from "./styles"
import { areas, niveis } from "./dados"
import { Area, Nivel } from "../../global/types"
import { Header } from "../../../components/Header"
import { AreaItem } from "../../../components/AreaItem"

export default function Study({ navigation }: BottomTabScreenProps<ParamListBase>) {
    // id da área que está aberta (mostrando os níveis). null = nenhuma
    const [areaAberta, setAreaAberta] = useState<number | null>(null);

    function alternarArea(id: number){
        // Anima a abertura e o fechamento do painel
        LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut)
        setAreaAberta(areaAberta === id ? null : id)
    }

    function escolherNivel(area: Area, nivel: Nivel){
        // Em breve: abrir as questões desta área e deste nível
        Alert.alert('Em breve', `Questões de ${area.rotulo}, nível ${nivel.nome}.`)
    }

    return (
        <View style={style.container}>

            <Header title="Áreas da Matemática" onBack={() => navigation.navigate('Início')} />

            <ScrollView contentContainerStyle={style.content} showsVerticalScrollIndicator={false}>

                <Text style={style.instrucao}>Selecione o conteúdo que deseja focar agora:</Text>

                {areas.map(area => (
                    <AreaItem
                        key={area.id}
                        simbolo={area.simbolo}
                        titulo={area.rotulo}
                        aberta={areaAberta === area.id}
                        niveis={niveis}
                        onPress={() => alternarArea(area.id)}
                        onSelectNivel={nivel => escolherNivel(area, nivel)}
                    />
                ))}

            </ScrollView>
        </View>
    )
}
