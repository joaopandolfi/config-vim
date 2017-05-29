"""""""""""""""""""" ~/.vimrc por janjo """"""""""""""""""" "
   "
   " Retorna verdadeiro se o modo de copiar e colar estiver ativado
   function! HasPaste()
           if &paste
                   return 'PASTE MODE ON '
           en
                 return 'PASTE MODE OFF '
         return ''
 endfunction
  
  """""""""""""""""""" 1) Configurações gerais """"""""""""""""""""
 "
 " Usa as definições do vim, não as do vi
 set nocompatible
  
 " set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
 
 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
 
 
 
 " Meus plugins
 Plugin 'tpope/vim-rails'
 Plugin 'tpope/vim-rake'
 Plugin 'thoughtbot/vim-rspec'
 Plugin 'vim-ruby/vim-ruby'
 Plugin 'tpope/vim-bundler'
 Plugin 'scrooloose/nerdtree'
 Plugin 'tpope/vim-projectionist'
 Plugin 'jlanzarotta/bufexplorer'
 Plugin 'tomtom/tcomment_vim'
 Plugin 'christoomey/vim-tmux-navigator'
 
 " " All of your Plugins must be added before the following line
 call vundle#end()            " required
  
 set nocompatible      " We're running Vim, not Vi!
 syntax on             " Enable syntax highlighting
 filetype on           " Enable filetype detection
 filetype indent on    " Enable filetype-specific indenting
 filetype plugin on    " Enable filetype-specific plugins
 " filetype plugin indent on    " equired 
 set history=1000
  
 " Recarrega o arquivo caso ele seja editado por um programa externo enquanto aberto
  set autoread
   
 """""""""""""""""""" 2) Interface do vim """""""""""""""""""""
 set wildmenu
 
 " Sempre mostra a posição atual do cursor
 set ruler
 
 " Altura da barra de comandos
 set cmdheight=2
 
 " Configurando a tecla <Backspace> para o que ela tem que fazer
 set backspace=eol,start,indent
 set whichwrap+=<,>,h,l
 
 " Destaca os resultados da busca
 set hlsearch
 
 " Habilita expressões regulares
 set magic
 
 " Destaca pares de colchetes ao passar o cursor, e configura o tempo do destaque em décimos de segundo
 set showmatch
 set mat=10
 
 
 """""""""""""""""""" 3) Cores e fontes """"""""""""""""""""
 " Ativa a numeração das linhas
 set number
 
 " Habilita o destaque de sintaxe
 syntax enable
 
 " Esquema de cores do vim
 colorscheme monokai

"set background=light
" Desativa a quebra de linha automática (comentado por padrão)
set nolinebreak

" Permite a navegação dentro de uma mesma linha longa com j e k
set wrap

" Insere espaços no lugar de caracteres de tabulação
set expandtab

" Uso inteligente de tabulações
set smarttab

" Define uma tabulação como sendo oito espaços
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent

" Sempre mostra a linha de status
set laststatus=2

" Formato da linha de status
set statusline=\ %{HasPaste()}\ Arquivo:\ %F%m%r%h\ %w\ \ Diretório\ de\ trabalho:\ %r%{getcwd()}%h\ -\ Linha:\ %l\ -\ Coluna:\ %c

" Preserva o histórico do desfazer após o fim da sessão atual salvando-o em um arquivo
set undodir=~/.vim/undobackups
set undofile
 if filereadable(expand("~/.vim/plugin/abbreviations.vim"))
         source ~/.vim/plugin/abbreviations.vim
 endif
 


 

 

