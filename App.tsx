import React, { useState } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import Login from './src/pages/login';
import Register from './src/pages/register';
import Tabs from './src/routes/Tabs';
import { Sessao } from './src/global/types';
import { SessaoProvider } from './src/contexts/SessaoContext';

export default function App(){
  const [screen, setScreen] = useState<'login' | 'register'>('login');
  const [sessao, setSessao] = useState<Sessao | null>(null);

  // Logado: mostra as abas (Início, Estudar e Perfil)
  if(sessao){
    return (
      <SessaoProvider value={sessao}>
        <SafeAreaProvider>
          <NavigationContainer>
            <Tabs
              usuario={sessao.usuario}
              onLogout={() => { setSessao(null); setScreen('login'); }}
            />
          </NavigationContainer>
        </SafeAreaProvider>
      </SessaoProvider>
    );
  }

  // Não logado: login ou cadastro
  if(screen === 'register'){
    return <Register onGoToLogin={() => setScreen('login')} />;
  }

  return <Login onGoToRegister={() => setScreen('register')} onLogin={setSessao} />;
}
