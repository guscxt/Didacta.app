import { Dimensions, StyleSheet } from "react-native";
import { themas } from "../../global/themes";

export const style = StyleSheet.create({

    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    },

    boxTop: {
        height: Dimensions.get('window').height * 0.23,
        width: '100%',
        backgroundColor: themas.colors.primary,
        alignItems: 'center',
        justifyContent: 'center',
    },

    //Área rolável com os campos 
    boxMid: {
        flex: 1,
        width: '100%',
    },

    boxMidContent: {
        paddingHorizontal: 35,
        paddingTop: 20,
        paddingBottom: 30,
    },

    boxBottom: {
        width: '100%',
        alignItems: 'center',
        paddingBottom: 20,
    },

    logo: {
        marginTop: 20,
        width: 80,
        height: 80
    },

    //Estilo do sub-título "Criar conta"
    text: {
        color: '#ffff',
        marginTop: 10,
        fontSize: 18,
    },

    //Estilo do texto de Já tem conta
    textBottom: {
        fontSize: 14,
        color: themas.colors.gray
    },

    //Estilo do texto de Entrar
    textBottomCreate: {
        fontSize: 15,
        color: themas.colors.primary,
        fontWeight: 'bold'
    },

})
