import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

export const style = StyleSheet.create({

    button: {
        width: '100%',
        height: 50,
        marginTop: 20,
        marginBottom: 10,
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: themas.colors.primary,
        borderRadius: 10,

        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,

        elevation: 5,
    },

    textButton: {
        fontSize: 16,
        color: '#ffff',
        fontWeight: 'bold'
    },

    //Botão com borda (Acesso Administrador)
    buttonOutline: {
        flexDirection: 'row',
        width: '100%',
        height: 50,
        marginBottom: 10,
        alignItems: 'center',
        justifyContent: 'center',
        borderWidth: 1,
        borderColor: themas.colors.lightGray,
        borderRadius: 10
    },

    textButtonOutline: {
        fontSize: 14,
        fontWeight: 'bold',
        color: themas.colors.gray,
        marginLeft: 8
    }

})
