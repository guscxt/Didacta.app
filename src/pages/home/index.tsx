import React from "react";
import { View, Text, ScrollView } from "react-native";

import { style } from "./styles"
import { themas } from "../../global/themes"
import { resumoExemplo, ResumoProgresso } from "./dados"
import { Header } from "../../../components/Header"
import { StatCard } from "../../../components/StatCard"
import { BarChart } from "../../../components/BarChart"
import { ProgressRow } from "../../../components/ProgressRow"

export default function Home() {
    // Por enquanto são dados fixos de exemplo.
    // Depois, trocar por uma chamada ao backend (GET /progresso).
    const resumo: ResumoProgresso = resumoExemplo

    const barras = resumo.porConteudo.map(conteudo => ({
        rotulo: conteudo.nome,
        valor: conteudo.total > 0 ? Math.round((conteudo.acertos / conteudo.total) * 100) : 0,
    }))

    return (
        <View style={style.container}>

            <Header title="Meu Progresso" subtitle="Acompanhe sua evolução" />

            <ScrollView contentContainerStyle={style.content} showsVerticalScrollIndicator={false}>

                <View style={style.grid}>
                    <StatCard
                        icon="help-circle-outline"
                        color={themas.colors.purple}
                        value={String(resumo.questoesRespondidas)}
                        label="Questões respondidas"
                    />
                    <StatCard
                        icon="locate-outline"
                        color={themas.colors.green}
                        value={`${resumo.taxaAcerto}%`}
                        label="Taxa de acerto"
                    />
                    <StatCard
                        icon="time-outline"
                        color={themas.colors.primary}
                        value={String(resumo.minutosHoje)}
                        label="Min estudados hoje"
                    />
                    <StatCard
                        icon="radio-button-on-outline"
                        color={themas.colors.primary}
                        value={`${resumo.sequenciaDias} ${resumo.sequenciaDias === 1 ? 'dia' : 'dias'}`}
                        label="Sequência atual"
                    />
                </View>

                <BarChart titulo="Desempenho por Conteúdo (%)" dados={barras} />

                <Text style={style.sectionTitle}>Evolução por Conteúdo</Text>

                {resumo.porConteudo.map(conteudo => (
                    <ProgressRow
                        key={conteudo.nome}
                        nome={conteudo.nome}
                        acertos={conteudo.acertos}
                        total={conteudo.total}
                    />
                ))}

            </ScrollView>
        </View>
    )
}
