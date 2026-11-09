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

})
