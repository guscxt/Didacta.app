import { StyleSheet } from "react-native";
import { themas } from "../../global/themes";

export const style = StyleSheet.create({

    container: {
        flex: 1,
        backgroundColor: themas.colors.bgScreen,
    },

    body: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
        paddingHorizontal: 40,
    },

    text: {
        textAlign: 'center',
        fontSize: 15,
        color: themas.colors.textMuted,
    },

})
