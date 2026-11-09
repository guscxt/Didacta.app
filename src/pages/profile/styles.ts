import { StyleSheet } from "react-native";
import { themas } from "../../global/themes";

export const style = StyleSheet.create({

    container: {
        flex: 1,
        backgroundColor: themas.colors.bgScreen,
    },

    body: {
        padding: 20,
    },

    card: {
        padding: 16,
        borderRadius: 16,
        borderWidth: 1,
        borderColor: themas.colors.border,
        backgroundColor: themas.colors.card,
    },

    label: {
        fontSize: 13,
        color: themas.colors.textMuted,
    },

    value: {
        marginTop: 2,
        marginBottom: 14,
        fontSize: 16,
        fontWeight: 'bold',
        color: themas.colors.text,
    },

})
