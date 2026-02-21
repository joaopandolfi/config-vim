"""""""""""""""""""" ~/.vimrc por janjo && joaopandolfi """"""""""""""""""" "

" ========================
" 1) BASE
" ========================
set nocompatible
syntax on
filetype plugin indent on

set history=1000
set autoread

" ========================
" 2) INTERFACE
" ========================
set wildmenu
set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set showmatch
set mat=10
set mouse=a
set number
set background=dark
set wrap
set laststatus=2

" ========================
" 3) INDENTAÇÃO
" ========================
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" ========================
" 4) STATUSLINE
" ========================
function! HasPaste()
  if &paste
    return 'PASTE MODE '
  endif
  return ''
endfunction

set statusline=%{HasPaste()}%f\ %y\ %m\ %=L:%l\ C:%c

" ========================
" 5) VUNDLE
" ========================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bcicen/vim-vice'
Plugin 'fatih/vim-go'

call vundle#end()

" ========================
" 6) NERDTREE
" ========================
map <C-n> :NERDTreeToggle<CR>

autocmd VimEnter * if argc() == 0 | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")) | q | endif

" ========================
" 7) TABS
" ========================
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-m> :tabnew<CR>
map  <C-o> :tabnext<CR>
map  <C-i> :tabprev<CR>
nmap <C-d> :q<CR>

" ========================
" 8) RSpec
" ========================
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ========================
" 9) THEME
" ========================
set term=screen-256color
colorscheme vice

" ========================
" 10) PASTE AUTOMÁTICO (SEM F12)
" ========================

" remove qualquer toggle antigo
set pastetoggle=
silent! unmap <F12>
silent! iunmap <F12>
silent! vunmap <F12>

" melhora resposta do terminal
set ttimeout
set ttimeoutlen=10

" suporte robusto a bracketed paste
if &term =~# 'xterm' || &term =~# 'screen' || &term =~# 'tmux'

  " habilita bracketed paste ao entrar em insert
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"

  " begin paste
  inoremap <silent> <special> <Esc>[200~ <C-o>:set paste<CR>

  " end paste
  inoremap <silent> <special> <Esc>[201~ <C-o>:set nopaste<CR>

  " segurança extra
  autocmd InsertLeave * set nopaste
  autocmd BufLeave * set nopaste
endif

" ========================
" 11) AUTOCOMPLETE TAB (RESPEITA PASTE)
" ========================
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  elseif a:direction == "backward"
    return "\<C-p>"
  else
    return "\<C-n>"
  endif
endfunction

inoremap <expr> <Tab> (&paste ? "\<Tab>" : InsertTabWrapper("forward"))
inoremap <expr> <S-Tab> (&paste ? "\<S-Tab>" : InsertTabWrapper("backward"))
