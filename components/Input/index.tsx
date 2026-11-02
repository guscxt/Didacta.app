import React, { forwardRef, LegacyRef } from "react";
import { View, Text, TextInput, TextInputProps, Touchable, TouchableOpacity } from 'react-native';
import { styles } from "./styles";
import { FontAwesome, MaterialIcons, Octicons } from '@expo/vector-icons'
import { themas } from "../../src/global/themes";

type IconComponents = React.ComponentType<React.ComponentProps<typeof MaterialIcons>> |
    React.ComponentType<React.ComponentProps<typeof FontAwesome>> |
    React.ComponentType<React.ComponentProps<typeof Octicons>>

type Props = TextInputProps & {
    IconLeft?: IconComponents,
    IconRight?: IconComponents,
    iconLeftName?: string,
    iconRightName?: string,
    title?: string,
    onIconLeftPress?: () => void,
    onIconRightPress?: () => void
}

export const Input = forwardRef((Props: Props, ref: LegacyRef<TextInput> | null) => {

    const { IconLeft, IconRight, iconLeftName, iconRightName, title, onIconLeftPress, onIconRightPress, ...rest } = Props

    const calculateSizeWidth = ()=> {
        if(IconLeft && IconRight){
            return '80%'
        }else if(IconLeft || IconRight){
            return '90%'
        }else{
            return '100%'
        }
    }

    const calculateSizePaddingLeft = ()=> {
        if(IconLeft && IconRight){
            return 5;
        }else if(IconLeft || IconRight){
            return 10;
        }else{
            return 20;
        }
    }
    return (
        <>
            <Text style={styles.titleInput}>{title}</Text>
            <View style={[styles.boxInput, {paddingLeft: calculateSizePaddingLeft()}]}>
                {IconLeft && iconLeftName && (
                    <TouchableOpacity onPress={onIconLeftPress} style={styles.button}>
                        <IconLeft name={iconLeftName as any} size={20} color={themas.colors.gray} style={styles.Icon} />
                    </TouchableOpacity>
                )}
                <TextInput
                    style={[styles.input,{width:calculateSizeWidth()}]}
                    {...rest}
                />
                {IconRight && iconRightName && (
                    <TouchableOpacity onPress={onIconRightPress} style={styles.button}>
                        <IconRight name={iconRightName as any} size={20} color={themas.colors.gray} style={styles.Icon} />
                    </TouchableOpacity>
                )}
            </View>
        </>
    )
})  
