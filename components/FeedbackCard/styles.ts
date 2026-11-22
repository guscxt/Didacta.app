import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

const VERMELHO = '#dc2626';

export const style = StyleSheet.create({

    card: {
        marginTop: 4,
        padding: 18,
        borderRadius: 20,
        borderWidth: 1,
    },

    cardCorreta: {
        borderColor: '#bcd0f7',
        backgroundColor: '#eaf1ff',
    },

    cardErrada: {
        borderColor: '#f0b3b3',
        backgroundColor: '#fdecec',
    },

    //Cores do título 
    corCorreta: {
        color: themas.colors.primary,
    },

    corErrada: {
        color: VERMELHO,
    },

    titulo: {
        flexDirection: 'row',
        alignItems: 'center',
    },

    tituloTexto: {
        marginLeft: 8,
        fontSize: 17,
        fontWeight: 'bold',
    },

    resolucao: {
        marginTop: 10,
        fontSize: 14,
        lineHeight: 21,
        color: themas.colors.text,
    },

    botoes: {
        flexDirection: 'row',
        gap: 12,
        marginTop: 16,
    },

    botaoRefazer: {
        flex: 1,
        height: 48,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 12,
        borderWidth: 1.5,
        borderColor: '#e8a3a3',
        backgroundColor: '#fdecec',
    },

    botaoRefazerTexto: {
        marginLeft: 6,
        fontSize: 15,
        fontWeight: 'bold',
        color: VERMELHO,
    },

    botaoProxima: {
        flex: 1,
        height: 48,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 12,
        backgroundColor: themas.colors.primary,
    },

    botaoProximaTexto: {
        marginRight: 4,
        fontSize: 15,
        fontWeight: 'bold',
        color: '#ffffff',
    },

})
