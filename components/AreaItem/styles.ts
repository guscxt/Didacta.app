import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

export const style = StyleSheet.create({

    card: {
        marginBottom: 12,
        borderRadius: 16,
        borderWidth: 1,
        borderColor: themas.colors.border,
        backgroundColor: themas.colors.card,

        shadowColor: "#000",
        shadowOffset: { width: 0, height: 1 },
        shadowOpacity: 0.06,
        shadowRadius: 3,
        elevation: 2,
    },

    row: {
        flexDirection: 'row',
        alignItems: 'center',
        paddingHorizontal: 16,
        paddingVertical: 14,
    },

    //Círculo azul claro com o símbolo da área
    circle: {
        width: 40,
        height: 40,
        borderRadius: 20,
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: '#e8eefb',
    },

    simbolo: {
        fontSize: 18,
        fontWeight: 'bold',
        color: themas.colors.primary,
    },

    titulo: {
        flex: 1,
        marginLeft: 16,
        fontSize: 16,
        fontWeight: '600',
        color: themas.colors.text,
    },

    //Painel que desce embaixo da área escolhida
    painel: {
        paddingHorizontal: 16,
        paddingTop: 14,
        paddingBottom: 16,
        borderTopWidth: 1,
        borderTopColor: themas.colors.border,
    },

    painelTitulo: {
        marginBottom: 12,
        fontSize: 13,
        color: themas.colors.textMuted,
    },

    niveis: {
        flexDirection: 'row',
        gap: 10,
    },

    nivel: {
        flex: 1,
        alignItems: 'center',
        paddingVertical: 12,
        borderRadius: 12,
        borderWidth: 1,
    },

    nivelTexto: {
        fontSize: 14,
        fontWeight: 'bold',
    },

})
