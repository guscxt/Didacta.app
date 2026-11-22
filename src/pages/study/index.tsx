import React, { useState } from "react";
import { View, Text, ScrollView, LayoutAnimation } from "react-native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";

import { style } from "./styles"
import { areas, niveis } from "./dados"
import { Area, Nivel, StudyStackParamList } from "../../global/types"
import { Header } from "../../../components/Header"
import { AreaItem } from "../../../components/AreaItem"

export default function Study({ navigation }: NativeStackScreenProps<StudyStackParamList, 'Areas'>) {
    
    const [areaAberta, setAreaAberta] = useState<number | null>(null);

    function alternarArea(id: number){
        
        LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut)
        setAreaAberta(areaAberta === id ? null : id)
    }

    function escolherNivel(area: Area, nivel: Nivel){
        navigation.navigate('Questoes', { area, nivel })
    }

    return (
        <View style={style.container}>

            <Header title="Áreas da Matemática" onBack={() => navigation.getParent()?.navigate('Início')} />

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
