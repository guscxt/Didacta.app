import React, { useState } from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import Login from './src/pages/login';
import Register from './src/pages/register';

export default function App(){
  const [screen, setScreen] = useState<'login' | 'register'>('login');

  if(screen === 'register'){
    return <Register onGoToLogin={() => setScreen('login')} />;
  }

  return <Login onGoToRegister={() => setScreen('register')} />;
}
