import { StyleSheet } from "react-native";
import { themas } from "../../global/themes";

export const style = StyleSheet.create({

    container: {
        flex: 1,
        backgroundColor: themas.colors.bgScreen,
    },

    content: {
        padding: 20,
        paddingBottom: 32,
    },

    //Carregando e erro da primeira carga
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

    //Aviso quando falha ao atualizar e já havia dados na tela
    aviso: {
        marginBottom: 12,
        textAlign: 'center',
        fontSize: 13,
        color: '#dc2626',
    },

    //Grade 2x2 dos cards de números
    grid: {
        flexDirection: 'row',
        flexWrap: 'wrap',
        justifyContent: 'space-between',
    },

    sectionTitle: {
        marginTop: 24,
        marginBottom: 12,
        fontSize: 18,
        fontWeight: 'bold',
        color: themas.colors.text,
    },

    vazio: {
        paddingVertical: 8,
        fontSize: 14,
        lineHeight: 21,
        color: themas.colors.textMuted,
    },

})