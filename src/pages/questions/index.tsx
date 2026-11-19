import React, { useCallback, useEffect, useRef, useState } from "react";
import { View, Text, ScrollView, ScrollViewInstance, ActivityIndicator, Alert } from "react-native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";

import { style } from "./styles"
import { themas } from "../../global/themes"
import { StudyStackParamList } from "../../global/types"
import { useSessao } from "../../contexts/SessaoContext"
import { Questao, ResultadoResposta, listarQuestoes, responderQuestao } from "../../services/questoes"
import { QuizHeader } from "../../../components/QuizHeader"
import { AlternativeItem, EstadoAlternativa } from "../../../components/AlternativeItem"
import { FeedbackCard } from "../../../components/FeedbackCard"
import { Button } from "../../../components/Button"

// Cada área tem 10 questões por nível no banco
const QUESTOES_POR_RODADA = 10

export default function Questions({ navigation, route }: NativeStackScreenProps<StudyStackParamList, 'Questoes'>) {
    const { area, nivel } = route.params
    const { token } = useSessao()
    const rolagem = useRef<ScrollViewInstance>(null)

    // Carregamento das questões
    const [questoes, setQuestoes] = useState<Questao[]>([]);
    const [carregando, setCarregando] = useState(true);
    const [erro, setErro] = useState<string | null>(null);

    // Andamento da rodada
    const [indice, setIndice] = useState(0);
    const [escolha, setEscolha] = useState<string | null>(null);
    const [resultado, setResultado] = useState<ResultadoResposta | null>(null);
    const [enviando, setEnviando] = useState(false);
    const [jaRespondeu, setJaRespondeu] = useState(false);   // já respondeu esta questão nesta rodada?
    const [acertosDePrimeira, setAcertosDePrimeira] = useState(0);
    const [terminou, setTerminou] = useState(false);

    const carregar = useCallback(async () => {
        setCarregando(true)
        setErro(null)

        try {
            const lista = await listarQuestoes(token, area.id, nivel.id)
            setQuestoes(lista)
        } catch (error) {
            setErro(error instanceof Error ? error.message : 'Não foi possível carregar as questões.')
        } finally {
            setCarregando(false)
        }
    }, [token, area.id, nivel.id])

    useEffect(() => {
        carregar()
    }, [carregar])

    const questao = questoes[indice]
    const total = questoes.length > 0 ? questoes.length : QUESTOES_POR_RODADA
    const atual = questoes.length === 0 ? 0 : terminou ? total : indice + 1

    async function escolherAlternativa(letra: string){
        if(resultado || enviando || !questao) return

        setEscolha(letra)
        setEnviando(true)

        try {
            const resposta = await responderQuestao(token, questao.id, letra)
            setResultado(resposta)

            // Conta o acerto só na primeira vez que o aluno responde a questão
            if(!jaRespondeu){
                setJaRespondeu(true)
                if(resposta.correta) setAcertosDePrimeira(acertos => acertos + 1)
            }

            // Leva a tela até a resolução
            setTimeout(() => rolagem.current?.scrollToEnd({ animated: true }), 150)
        } catch (error) {
            setEscolha(null)
            Alert.alert('Erro!', error instanceof Error ? error.message : 'Não foi possível enviar a resposta.')
        } finally {
            setEnviando(false)
        }
    }

    function refazer(){
        // Volta a questão ao começo para o aluno tentar de novo
        setEscolha(null)
        setResultado(null)
        rolagem.current?.scrollTo({ y: 0, animated: true })
    }

    function proxima(){
        if(indice + 1 >= questoes.length){
            setTerminou(true)
            return
        }

        setIndice(indice + 1)
        setEscolha(null)
        setResultado(null)
        setJaRespondeu(false)
        rolagem.current?.scrollTo({ y: 0, animated: false })
    }

    function recomecar(){
        setIndice(0)
        setEscolha(null)
        setResultado(null)
        setJaRespondeu(false)
        setAcertosDePrimeira(0)
        setTerminou(false)
    }

    function sair(){
        const temAndamento = indice > 0 || resultado !== null

        if(terminou || !temAndamento){
            navigation.goBack()
            return
        }

        Alert.alert('Sair das questões?', 'As respostas que você já deu ficam salvas.', [
            { text: 'Continuar', style: 'cancel' },
            { text: 'Sair', onPress: () => navigation.goBack() },
        ])
    }

    function estadoDaAlternativa(letra: string): EstadoAlternativa {
        if(!resultado) return escolha === letra ? 'selecionada' : 'normal'
        if(letra === resultado.letraCorreta) return 'correta'
        if(letra === escolha) return 'errada'
        return 'neutra'
    }

    function conteudo(){
        if(carregando){
            return (
                <View style={style.centro}>
                    <ActivityIndicator size="large" color={themas.colors.primary} />
                </View>
            )
        }

        if(erro){
            return (
                <View style={style.centro}>
                    <Text style={style.mensagem}>{erro}</Text>
                    <Button text="Tentar de novo" onPress={carregar} />
                </View>
            )
        }

        if(questoes.length === 0){
            return (
                <View style={style.centro}>
                    <Text style={style.mensagem}>Ainda não há questões de {area.rotulo} no nível {nivel.nome}.</Text>
                </View>
            )
        }

        if(terminou){
            return (
                <ScrollView contentContainerStyle={style.content}>
                    <View style={style.fim}>
                        <Text style={style.fimEmoji}>🎉</Text>
                        <Text style={style.fimTitulo}>Rodada concluída!</Text>
                        <Text style={style.fimTexto}>
                            Você acertou {acertosDePrimeira} de {questoes.length} questões de {area.rotulo} ({nivel.nome}) de primeira.
                        </Text>

                        <View style={style.fimBotoes}>
                            <Button text="Voltar às áreas" onPress={() => navigation.goBack()} />
                            <Button text="Estudar de novo" variant="outline" onPress={recomecar} />
                        </View>
                    </View>
                </ScrollView>
            )
        }

        return (
            <ScrollView ref={rolagem} contentContainerStyle={style.content} showsVerticalScrollIndicator={false}>

                <View style={style.chip}>
                    <Text style={style.chipTexto}>{nivel.nome}</Text>
                </View>

                <View style={style.enunciadoCard}>
                    <Text style={style.areaLabel}>{area.nome.toUpperCase()}</Text>
                    <Text style={style.enunciado}>{questao.enunciado}</Text>
                </View>

                {questao.alternativas.map(alternativa => (
                    <AlternativeItem
                        key={alternativa.letra}
                        letra={alternativa.letra}
                        texto={alternativa.texto}
                        estado={estadoDaAlternativa(alternativa.letra)}
                        desabilitada={resultado !== null || enviando}
                        onPress={() => escolherAlternativa(alternativa.letra)}
                    />
                ))}

                {resultado && (
                    <FeedbackCard
                        correta={resultado.correta}
                        resolucao={resultado.resolucao}
                        ultima={indice + 1 >= questoes.length}
                        onRefazer={refazer}
                        onProxima={proxima}
                    />
                )}

            </ScrollView>
        )
    }

    return (
        <View style={style.container}>
            <QuizHeader atual={atual} total={total} onClose={sair} />
            {conteudo()}
        </View>
    )
}
