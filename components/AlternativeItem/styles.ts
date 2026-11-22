import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

const VERMELHO = '#dc2626';

export const style = StyleSheet.create({

    card: {
        flexDirection: 'row',
        alignItems: 'center',
        marginBottom: 12,
        paddingHorizontal: 16,
        paddingVertical: 14,
        borderRadius: 16,
        borderWidth: 1.5,
        borderColor: themas.colors.border,
        backgroundColor: themas.colors.card,
    },

    cardSelecionada: {
        borderColor: themas.colors.primary,
        backgroundColor: '#f4f7ff',
    },

    cardCorreta: {
        borderColor: themas.colors.primary,
        backgroundColor: '#eaf1ff',
    },

    cardErrada: {
        borderColor: VERMELHO,
        backgroundColor: '#fdecec',
    },

    //Círculo com a letra (ou com o ícone de certo/errado)
    circulo: {
        width: 28,
        height: 28,
        borderRadius: 14,
        borderWidth: 1.5,
        alignItems: 'center',
        justifyContent: 'center',
        borderColor: themas.colors.border,
        backgroundColor: themas.colors.card,
    },

    circuloSelecionada: {
        borderColor: themas.colors.primary,
    },

    circuloCorreta: {
        borderColor: themas.colors.primary,
        backgroundColor: themas.colors.primary,
    },

    circuloErrada: {
        borderColor: VERMELHO,
        backgroundColor: VERMELHO,
    },

    letra: {
        fontSize: 13,
        fontWeight: 'bold',
        color: themas.colors.textMuted,
    },

    letraSelecionada: {
        color: themas.colors.primary,
    },

    letraNeutra: {
        color: '#b6bccb',
    },

    texto: {
        flex: 1,
        marginLeft: 14,
        fontSize: 16,
        fontWeight: '600',
        color: themas.colors.text,
    },

    textoSelecionada: {
        color: themas.colors.primary,
    },

    textoCorreta: {
        color: themas.colors.primary,
        fontWeight: 'bold',
    },

    textoErrada: {
        color: VERMELHO,
        fontWeight: 'bold',
    },

    textoNeutra: {
        color: '#9aa3b5',
    },

})
