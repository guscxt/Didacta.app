import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

export const styles = StyleSheet.create({

    boxInput: {
        height: 40,
        width: '100%',
        marginTop: 10,
        borderWidth: 0.5,
        borderRadius: 10,
        borderColor: themas.colors.lightGray,
        backgroundColor: themas.colors.lightGray,
        flexDirection: 'row',
        alignItems: 'center'
    },

    input: {
        height: '100%',
        width: '90%',
        borderRadius: 40
    },

    titleInput: {
        alignSelf: 'flex-start',
        marginLeft: 5,
        marginTop: 20,
        color: themas.colors.gray
    },

    Icon:{
        width:'100%',
        textAlign: 'center'
    },

    button:{
        width:'10%',
        height: '100%',
        alignItems: 'center',
        justifyContent: 'center'
    }
})
