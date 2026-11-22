import React, { useCallback, useState } from "react";
import { View, Text, ScrollView, ActivityIndicator, RefreshControl } from "react-native";
import { useFocusEffect } from "@react-navigation/native";

import { style } from "./styles"
import { themas } from "../../global/themes"
import { useSessao } from "../../contexts/SessaoContext"
import { ResumoProgresso, buscarProgresso } from "../../services/progresso"
import { areas } from "../study/dados"
import { Header } from "../../../components/Header"
import { StatCard } from "../../../components/StatCard"
import { BarChart } from "../../../components/BarChart"
import { ProgressRow } from "../../../components/ProgressRow"
import { Button } from "../../../components/Button"

function rotuloDoConteudo(nome: string){
    return areas.find(area => area.nome === nome)?.rotulo ?? nome
}

export default function Home() {
    const { token } = useSessao()

    const [resumo, setResumo] = useState<ResumoProgresso | null>(null)
    const [carregando, setCarregando] = useState(true)      
    const [atualizando, setAtualizando] = useState(false)   
    const [erro, setErro] = useState<string | null>(null)

    const carregar = useCallback(async () => {
        setErro(null)

        try {
            setResumo(await buscarProgresso(token))
        } catch (error) {
            setErro(error instanceof Error ? error.message : 'Não foi possível carregar o seu progresso.')
        } finally {
            setCarregando(false)
            setAtualizando(false)
        }
    }, [token])

    useFocusEffect(
        useCallback(() => {
            carregar()
        }, [carregar])
    )

    function conteudo(){
        if(!resumo){
            if(carregando){
                return (
                    <View style={style.centro}>
                        <ActivityIndicator size="large" color={themas.colors.primary} />
                    </View>
                )
            }

            return (
                <View style={style.centro}>
                    <Text style={style.mensagem}>{erro}</Text>
                    <Button text="Tentar de novo" onPress={() => { setCarregando(true); carregar() }} />
                </View>
            )
        }

        const barras = resumo.porConteudo.map(item => ({
            rotulo: rotuloDoConteudo(item.nome),
            valor: item.total > 0 ? Math.round((item.acertos / item.total) * 100) : 0,
        }))

        return (
            <ScrollView
                contentContainerStyle={style.content}
                showsVerticalScrollIndicator={false}
                refreshControl={
                    <RefreshControl
                        refreshing={atualizando}
                        onRefresh={() => { setAtualizando(true); carregar() }}
                        colors={[themas.colors.primary]}
                    />
                }
            >

                {erro && <Text style={style.aviso}>Não foi possível atualizar agora. Puxe a tela para tentar de novo.</Text>}

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

                {resumo.porConteudo.length === 0 ? (
                    <Text style={style.vazio}>Você ainda não respondeu nenhuma questão. Vá em Estudar e escolha um conteúdo para começar.</Text>
                ) : (
                    resumo.porConteudo.map(item => (
                        <ProgressRow
                            key={item.nome}
                            nome={item.nome}
                            acertos={item.acertos}
                            total={item.total}
                        />
                    ))
                )}

            </ScrollView>
        )
    }

    return (
        <View style={style.container}>

            <Header title="Meu Progresso" subtitle="Acompanhe sua evolução" />

            {conteudo()}

        </View>
    )
}
