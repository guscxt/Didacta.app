import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

export const style = StyleSheet.create({

    card: {
        width: '48%',
        marginBottom: 12,
        padding: 16,
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

    value: {
        marginTop: 12,
        fontSize: 28,
        fontWeight: 'bold',
        color: themas.colors.text,
    },

    label: {
        marginTop: 2,
        fontSize: 14,
        color: themas.colors.textMuted,
    },

})
