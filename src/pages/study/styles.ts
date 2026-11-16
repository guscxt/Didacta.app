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

    instrucao: {
        marginBottom: 16,
        fontSize: 14,
        fontWeight: '600',
        color: themas.colors.textMuted,
    },

})
