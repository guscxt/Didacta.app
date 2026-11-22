import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

export const style = StyleSheet.create({

    container: {
        flexDirection: 'row',
        alignItems: 'center',
        paddingHorizontal: 20,
        paddingBottom: 12,
        backgroundColor: themas.colors.bgScreen,
    },

    //Barra de progresso 
    track: {
        flex: 1,
        height: 8,
        marginHorizontal: 14,
        borderRadius: 4,
        overflow: 'hidden',
        backgroundColor: '#dfe7f7',
    },

    fill: {
        height: '100%',
        borderRadius: 4,
        backgroundColor: themas.colors.primary,
    },

    contador: {
        fontSize: 13,
        fontWeight: 'bold',
        color: themas.colors.textMuted,
    },

})
