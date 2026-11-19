import React, { createContext, useContext } from "react";
import { Sessao } from "../global/types";

const SessaoContext = createContext<Sessao | null>(null);

export const SessaoProvider = SessaoContext.Provider;

// Qualquer tela do app logado pega o token e o usuário com: const { token, usuario } = useSessao()
export function useSessao(): Sessao {
    const sessao = useContext(SessaoContext);

    if(!sessao){
        throw new Error('useSessao só pode ser usado com o usuário logado.');
    }

    return sessao;
}
