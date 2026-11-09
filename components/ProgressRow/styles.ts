import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

export const style = StyleSheet.create({

    card: {
        marginBottom: 12,
        padding: 16,
        borderRadius: 16,
        borderWidth: 1,
        borderColor: themas.colors.border,
        backgroundColor: themas.colors.card,
    },

    row: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
    },

    nome: {
        fontSize: 16,
        fontWeight: 'bold',
        color: themas.colors.text,
    },

    acertos: {
        fontSize: 14,
        fontWeight: 'bold',
        color: themas.colors.primary,
    },

    //Barra de progresso (fundo e preenchimento)
    track: {
        height: 8,
        marginTop: 12,
        borderRadius: 4,
        overflow: 'hidden',
        backgroundColor: '#dfe7f7',
    },

    fill: {
        height: '100%',
        borderRadius: 4,
        backgroundColor: themas.colors.primary,
    },

})
