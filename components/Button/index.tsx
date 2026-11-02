import React from "react";
import { ActivityIndicator, TouchableHighlightProps, TouchableOpacity, Text} from "react-native";
import { style } from "../../components/Button/styles";

type Props = TouchableHighlightProps & {
    text: string,
    loading?: boolean,
    variant?: 'primary' | 'outline',
    icon?: React.ReactNode
} 

export function Button({ variant = 'primary', icon, ...rest }: Props){
    const isOutline = variant === 'outline'

    return(
        <TouchableOpacity 
            style={isOutline ? style.buttonOutline : style.button}
            {...rest}
            activeOpacity={0.6} 
            > 
             
            {rest.loading ? <ActivityIndicator /> : (
                <>
                    {icon}
                    <Text style={isOutline ? style.textButtonOutline : style.textButton}>{rest.text}</Text>
                </>
            )}

        </TouchableOpacity>
    )

}
