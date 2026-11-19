import React from "react";
import { createNativeStackNavigator } from "@react-navigation/native-stack";

import { StudyStackParamList } from "../global/types"
import Study from "../pages/study"
import Questions from "../pages/questions"

const Stack = createNativeStackNavigator<StudyStackParamList>();

export default function StudyStack() {
    return (
        <Stack.Navigator screenOptions={{ headerShown: false }}>
            <Stack.Screen name="Areas" component={Study} />
            <Stack.Screen name="Questoes" component={Questions} />
        </Stack.Navigator>
    )
}
