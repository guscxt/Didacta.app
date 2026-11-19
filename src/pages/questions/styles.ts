import { StyleSheet } from "react-native";
import { themas } from "../../global/themes";

export const style = StyleSheet.create({

    container: {
        flex: 1,
        backgroundColor: themas.colors.bgScreen,
    },

    //Carregando, erro e "sem questões"
    centro: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
        paddingHorizontal: 32,
    },

    mensagem: {
        marginBottom: 8,
        textAlign: 'center',
        fontSize: 15,
        color: themas.colors.textMuted,
    },

    content: {
        paddingHorizontal: 20,
        paddingTop: 8,
        paddingBottom: 32,
    },

    //Etiqueta com o nível (Fácil, Médio ou Difícil)
    chip: {
        alignSelf: 'flex-start',
        marginBottom: 14,
        paddingHorizontal: 12,
        paddingVertical: 5,
        borderRadius: 12,
        backgroundColor: '#e3ebfb',
    },

    chipTexto: {
        fontSize: 13,
        fontWeight: 'bold',
        color: themas.colors.primary,
    },

    //Cartão azul claro com a área e o enunciado
    enunciadoCard: {
        marginBottom: 18,
        padding: 20,
        borderRadius: 20,
        backgroundColor: '#e9f0fd',
    },

    areaLabel: {
        marginBottom: 10,
        fontSize: 12,
        fontWeight: 'bold',
        letterSpacing: 1,
        color: themas.colors.primary,
    },

    enunciado: {
        fontSize: 20,
        lineHeight: 28,
        fontWeight: 'bold',
        color: themas.colors.text,
    },

    //Tela de rodada concluída
    fim: {
        alignItems: 'center',
        paddingTop: 40,
    },

    fimEmoji: {
        fontSize: 56,
    },

    fimTitulo: {
        marginTop: 12,
        fontSize: 24,
        fontWeight: 'bold',
        color: themas.colors.text,
    },

    fimTexto: {
        marginTop: 8,
        marginBottom: 24,
        textAlign: 'center',
        fontSize: 16,
        lineHeight: 23,
        color: themas.colors.textMuted,
    },

    fimBotoes: {
        width: '100%',
    },

})
