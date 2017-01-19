


"""""""""""""""""""" ~/.vimrc por lcavalheiro """"""""""""""""""""
"
" Autor: Luís Fernando Carvalho Cavalheiro (pessoal at profcavalheiro dot com)
" Versão: 0.4
" Licença: GPLv3
"
" O autor concede licença explícita para cópia, redistribuição e alteração
" deste arquivo nos termos explicitados pela licença GPLv3. Para obter uma
" cópia da licença, acesse http://www.gnu.org/licenses/gpl-3.0.html.
"
" Texto obrigatório
"
" This file is free software configuration code: you can redistribute it
" and/or modify it under the terms of the GNU General Public License as
" published by the Free Software Foundation, version 3..
"
" This configuration is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this configure rile.  If not, see <http://www.gnu.org/licenses/>.
"
"""""""""""""""""""" ~/.vimrc por lcavalheiro """"""""""""""""""""

"""""""""""""""""""" ~/.vimrc changelog """"""""""""""""""""
"
" 0.4 (20131008T191405-0300)
" Início da configuração de abreviaturas como plugins do vim
"
" 0.3 (20131008T181755-0300)
" Adicionada a linha que permite o uso do mouse no vim
"
" 0.2 (20131008T135851-0300)
" Estruturamento final do ~/.vimrc. Ajustes finais antes de divulgação
"
" 0.1 (20131008T120000-0300)
" Início da construção do ~/.vimrc. Estabelecimento do sistema de numeração
" (lançamento.versão.subversão). Primeiros cabeçalhos
"
"""""""""""""""""""" ~/.vimrc changelog """"""""""""""""""""

"""""""""""""""""""" ~/.vimrc índice """"""""""""""""""""
"
" 0) Definição de funções auxiliares
" 1) Configurações gerais
" 2) Interface do vim
" 3) Cores e fontes
" 4) Texto e tabulações
" 5) Linha de status
" 6) Desfazer persistente
" 7) Carrega plugin de abreviaturas
"
"""""""""""""""""""" ~/.vimrc índice """"""""""""""""""""

"""""""""""""""""""" 0) Definição de funções auxiliares """"""""""""""""""""
"
" Retorna verdadeiro se o modo de copiar e colar estiver ativado
function! HasPaste()
        if &paste
                return 'PASTE MODE ON '
        en
                return 'PASTE MODE OFF '
        return ''
endfunction
"
"""""""""""""""""""" 0) Definição de funções auxiliares """"""""""""""""""""


"""""""""""""""""""" 1) Configurações gerais """"""""""""""""""""
"
" Usa as definições do vim, não as do vi
set nocompatible

execute pathogen#infect()

set history=1000
"
" Habilita o reconhecimento de arquivos
filetype plugin on
filetype indent on
"
" Recarrega o arquivo caso ele seja editado por um programa externo enquanto aberto

set autoread
"
"
"""""""""""""""""""" 1) Configurações gerais """"""""""""""""""""

"""""""""""""""""""" 2) Interface do vim """""""""""""""""""""
"
" Ativa o menu WiLd (entre outras coisas, ativa <Ctrl>n e <Ctrl>p para navegar entre as correspondências da busca
set wildmenu
"
" Sempre mostra a posição atual do cursor
set ruler
"
" Altura da barra de comandos
set cmdheight=2
"
" Configurando a tecla <Backspace> para o que ela tem que fazer
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"
" Destaca os resultados da busca
set hlsearch
"
" Habilita expressões regulares
set magic
"
" Destaca pares de colchetes ao passar o cursor, e configura o tempo do destaque em décimos de segundo
set showmatch
set mat=10
"
"""""""""""""""""""" 2) Interface do vim """""""""""""""""""""

"""""""""""""""""""" 3) Cores e fontes """"""""""""""""""""
"
" Ativa a numeração das linhas
set number
"
" Habilita o destaque de sintaxe
syntax enable
"
" Esquema de cores do vim
colorscheme desert
set background=light
"
" Desativa a quebra de linha automática (comentado por padrão)
set nolinebreak
"
" Permite a navegação dentro de uma mesma linha longa com j e k
set wrap
"
"""""""""""""""""""" 3) Cores e fontes """"""""""""""""""""

"""""""""""""""""""" 4) Texto e tabulações """"""""""""""""""""
"
" Insere espaços no lugar de caracteres de tabulação
set expandtab
"
" Uso inteligente de tabulações
set smarttab
"
" Define uma tabulação como sendo oito espaços
set shiftwidth=8
set tabstop=8
"
"""""""""""""""""""" 4) Texto e tabulações """"""""""""""""""""

"""""""""""""""""""" 5) Linha de status """"""""""""""""""""
"
" Sempre mostra a linha de status
set laststatus=2
"
" Formato da linha de status
set statusline=\ %{HasPaste()}\ Arquivo:\ %F%m%r%h\ %w\ \ Diretório\ de\ trabalho:\ %r%{getcwd()}%h\ -\ Linha:\ %l\ -\ Coluna:\ %c
"
"""""""""""""""""""" 5) Linha de status """"""""""""""""""""

"""""""""""""""""""" 6) Desfazer persistente """"""""""""""""""""
"
" Preserva o histórico do desfazer após o fim da sessão atual salvando-o em um arquivo
set undodir=~/.vim/undobackups
set undofile
"
"""""""""""""""""""" 6) Desfazer persistente """"""""""""""""""""

"""""""""""""""""""" 7) Carrega plugin de abreviaturas """"""""""""""""""""
"

" Se existir, carrega o plugin de abreviaturas. Eu poderia criá-lo aqui, mas o
" bom senso me impede de fazê-lo.
"
" COMO FUNCIONA
" O plugin ~/.vim/plugin/abbreviations.vim funciona como um
" meta-carregador de abreviaturas. Ele não carregará as abreviatuas per se,
" mas criará abreviaturas no modo de comando que permitirão carregar os
" conjuntos definidos de abreviaturas.
if filereadable(expand("~/.vim/plugin/abbreviations.vim"))
        source ~/.vim/plugin/abbreviations.vim
endif
"
