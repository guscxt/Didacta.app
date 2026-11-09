import React from "react";
import { View, Text } from "react-native";
import { LinearGradient } from "expo-linear-gradient";
import { themas } from "../../src/global/themes";
import { style, PLOT_HEIGHT } from "./styles";

type Barra = {
    rotulo: string,
    valor: number   // de 0 a 100
}

type Props = {
    titulo: string,
    dados: Barra[]
}

const MARCAS = [100, 75, 50, 25, 0]

export function BarChart({ titulo, dados }: Props){
    return(
        <View style={style.card}>
            <Text style={style.title}>{titulo}</Text>

            {dados.length === 0 ? (
                <Text style={style.empty}>Responda algumas questões para ver seu desempenho aqui.</Text>
            ) : (
                <View>
                    <View style={style.plotRow}>

                        <View style={style.axis}>
                            {MARCAS.map(marca => (
                                <Text key={marca} style={style.axisText}>{marca}</Text>
                            ))}
                        </View>

                        <View style={style.plot}>
                            {MARCAS.map(marca => (
                                <View
                                    key={marca}
                                    style={[style.gridLine, { top: Math.min(((100 - marca) / 100) * PLOT_HEIGHT, PLOT_HEIGHT - 1) }]}
                                />
                            ))}

                            <View style={style.bars}>
                                {dados.map(barra => (
                                    <View key={barra.rotulo} style={style.barColumn}>
                                        <LinearGradient
                                            colors={[themas.colors.purple, themas.colors.magenta]}
                                            style={[style.bar, { height: (Math.max(0, Math.min(100, barra.valor)) / 100) * PLOT_HEIGHT }]}
                                        />
                                    </View>
                                ))}
                            </View>
                        </View>

                    </View>

                    <View style={style.labelsRow}>
                        <View style={style.labelsSpacer} />
                        <View style={style.labels}>
                            {dados.map(barra => (
                                <Text key={barra.rotulo} style={style.barLabel} numberOfLines={1} adjustsFontSizeToFit minimumFontScale={0.7}>
                                    {barra.rotulo}
                                </Text>
                            ))}
                        </View>
                    </View>
                </View>
            )}
        </View>
    )
}
