import { Dimensions, StyleSheet } from "react-native";
import { themas } from "../../global/themes";

export const style = StyleSheet.create({

    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'

    },


    boxTop: {

        height: Dimensions.get('window').height * 0.23, // ~22%, proporção da imagem
        width: '100%',
        backgroundColor: themas.colors.primary,
        alignItems: 'center',
        justifyContent: 'center',
    },

    boxMid: {

        flex: 1,
        marginTop: 80,
        width: '100%',
        paddingHorizontal: 35,
    },

    boxBottom: {

        width: '100%',
        alignItems: 'center',
        paddingBottom: 20,
    },


    logo: {
        marginTop:20,
        width: 80,
        height: 80
    },

    //Estilo do sub-título "Acesso ao Sistema"
    text: {
        //fontWeight: 'bold',
        color: '#ffff',
        marginTop: 10,
        fontSize: 18,

    },

    //Estilo do texto de cima dos inputs
    titleInput: {
        marginRight: 200,
        marginLeft: 5,
        marginTop: 20,
        color: themas.colors.gray
    },

    boxInput: {
        height: 40,
        width: '100%',
        marginTop: 10,
        borderWidth: 0.5,
        borderRadius: 10,
        borderColor: themas.colors.lightGray,
        backgroundColor: themas.colors.lightGray
    },

    input: {
        height: '100%',
        width: '90%',
        borderRadius: 40
    },

    //Estilo do texto de Não tem conta
    textBottom: {
        fontSize: 14,
        color: themas.colors.gray
    },

    //Estilo do texto de Cadastre-se
    textBottomCreate: {
        fontSize: 15,
        color: themas.colors.primary,
        fontWeight: 'bold'
    },

    //Área fixa no rodapé: linha divisória + botão de Acesso Administrador
    boxAdm: {
        flex: 1,
        width: '100%',
        justifyContent: 'flex-end',
        paddingBottom: 20,
    },

    divider: {
        width: '100%',
        height: 1,
        backgroundColor: themas.colors.lightGray,
        marginBottom: 10,
    },

})
