" Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Bundle 'christoomey/vim-conflicted'

Plugin 'jamessan/vim-gnupg'

Plugin 'elzr/vim-json'

Plugin 'ekalinin/Dockerfile.vim'

Plugin 'LaTeX-Box-Team/LaTeX-Box'

Plugin 'kshenoy/vim-signature'

call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Markdown Plugin
" let g:vim_markdown_folding_level=3
" set conceallevel=2

" Continue with next file in git difftool on hitting f4
map <silent> #4 :if &diff<CR>qa<CR>endif<CR>
"  F5-Taste: Zu HEX konvertieren
map #5 :%!xxd<CR>:setf xxd<CR>
"  F6-Taste: Von HEX zurück konvertieren
map #6 :%!xxd -r<CR>:setf none<CR>:filetype detect<CR>
"  F7-Taste: Aktuelle Zeile hervorheben ein/aus
map #7 :set cursorline!<CR>
"  F8-Taste: Filetype erkennen
map #8 :filetype detect<CR>
"  F9-Taste: HTML-Code erzeugen
map #9 :TOhtml<CR>

set lbr

" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"
" Saving
nnoremap <Leader>w :w<CR>
nnoremap <Leader><Leader>w :wa<CR>
nnoremap <Leader><Leader>q :wq<CR>
" Execute current line in vim
nmap <Leader><Leader>e :execute getline(".")<CR>
vmap <Leader><Leader>e :<BS><BS><BS><BS><BS>execute getreg("*")<CR>
" Copy/Paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>x "+x
nmap <Leader>X "+X
vmap <Leader>p "+p
vmap <Leader>P "+P
" Selections/Folds
nmap <Leader>v <C-v>
nmap <Leader><Leader> V
vmap <Leader><Leader> <Esc>
vmap <Leader>f zf
nmap <Leader>f za
nmap <Leader><Leader>f zA
nmap <Leader>F zd
nmap <Leader>g zR
nmap <Leader><Leader>g zM
" Search/Replace
nmap <Leader>s :s//g<Left><Left>
nmap <Leader><Leader>s :%s//g<Left><Left>
nmap <Leader><Leader>c :%s///gn<Left><Left><Left><Left>
vmap <Leader>s :s/\%V/g<Left><Left>
" Windows/Tabs
nmap <Leader>. <C-w>
" Highlights entfernen
nmap <Leader>/ :nohlsearch<CR>
" Enter fuer neue Zeilen
nmap <CR> o<Esc>k
nmap <S-CR> O<Esc>j

" Jump column down / up
" http://vi.stackexchange.com/questions/120/how-do-i-move-vertically-until-reaching-a-non-whitespace-character
nnoremap cd /\%<C-R>=virtcol(".")<CR>v\S<CR>:nohlsearch<CR>
nnoremap cu ?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohlsearch<CR>

command FormatJson setf json | %!python -m json.tool

let html_use_css = 1
" let html_number_lines = 0
" let html_no_pre = 1

if has('gui_running')
	" Farbschema bei gVim
	let g:molokai_original=0
	colorscheme molokai

	" Zeilennummerierung nur bei gVim
	set number
	" set relativenumber

	" au FocusLost * :set norelativenumber
	" au FocusGained * :set relativenumber
	" 
	" au InsertEnter * :set norelativenumber
	" au InsertLeave * :set relativenumber

	" au WinLeave * :set norelativenumber
	" au WinEnter * :set relativenumber

	" Aktuelle Zeile hervorheben
	set cursorline
	" Mark 80th column
	set cc=80


	if &diff
		set lines=999
		set columns=999
	else
		set lines=35
		set columns=116
	endif

	if (has("unix"))
		let uname = system("uname -s")
		if (uname == "Darwin\n")
			" mac stuff here
		else
			" linux stuff here
			set guifont=Ubuntu\ Mono\ 12
			map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
		endif
	else
		" windows stuff here
	endif

	" set foldcolumn=1

	" Startup
	" autocmd VimEnter * Ve
	" autocmd VimEnter * vertical resize 35
else
	" Farbschema bei vim
	if (has("unix"))
		let uname = system("uname -s")
		if (uname == "Darwin\n")
			" Mac stuff here
			colorscheme molokai
			set number
			set cursorline
			" Mark 80th column
			set cc=80
		else
			" Linux stuff here
			" Find out if 256 colors are possible
			colorscheme default
		endif
	else
		" Windows stuff here
		" Find out if 256 colors are possible
		colorscheme default
	endif
	syntax on
endif

if v:progname != "evim" && v:progname != "eview"
	" Splash-Screen deaktivieren
	set shortmess+=I

	" Toolbar deaktivieren
	set guioptions-=T

	" Scrollbalken deaktivieren
	set guioptions-=r
	set guioptions-=L

	"Maus deaktivieren
	"set mouse=c

	nnoremap <Left> :echoe "OMG VIM NOOB GTFO"<CR>
	nnoremap <Down> :echoe "OMG VIM NOOB GTFO"<CR>
	nnoremap <Up> :echoe "OMG VIM NOOB GTFO"<CR>
	nnoremap <Right> :echoe "OMG VIM NOOB GTFO"<CR>
endif

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Footer Bar
set ruler
set showcmd
set hlsearch

" Backups deaktivieren
set nobackup

" Indenting
" set smartindent
filetype plugin indent on

" Smart Case sensitivity
set autoindent
set ignorecase
set smartcase
set incsearch

" Tab width
set tabstop=4
set shiftwidth=4
set noexpandtab

" Spell checking
set spelllang=en_gb

" Macros

" Prefix sql columns in select with whatever stands in the first line of the
" buffer.
let @m='ggywjwG0x:%s/].*$//gggjVG$yA				a				pggywjwGwIAS "_ggywjGI".kdd:%s/\s\+/ /gggI''G$A'','
