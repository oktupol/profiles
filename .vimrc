"  F2-Taste: Speichern
map #2 :w
"  F3-Taste: Zeilennummerierung umschalten
"  		Relativ auf absolut
map #3 :set rnu!
"  F4-Taste: Zeilenumbruch umschalten
map #4 :set lbr!
"	"  F5-Taste: Syntax-Highlighting an
"	:map #5 :syntax on
"	"  F6-Taste: Syntax-Highliting aus
"	:map #6 :syntax off
"  F5-Taste: Zu HEX konvertieren
map #5 :%!xxd:setf xxd
"  F6-Taste: Von HEX zurück konvertieren
map #6 :%!xxd -r:setf none:filetype detect
"  F7-Taste: Aktuelle Zeile hervorheben ein/aus
map #7 :set cursorline!
"  F8-Taste: Filetype erkennen
map #8 :filetype detect
"  F9-Taste: Speichern und Schließen
map #9 :TOhtml

set lbr

" if has('gui_running')
" 	colorscheme torte
" 	set guifont=Ubuntu\ Mono\ 12	
" else
" 	colorscheme default
" endif

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
vmap <Leader>s :s/\%V/g<Left><Left>
" Windows/Tabs
nmap <Leader>. <C-w>

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
	
	" au InsertEnter * :set norelativenumber
	" au InsertLeave * :set relativenumber

	" au WinLeave * :set norelativenumber
	" au WinEnter * :set relativenumber

	" Aktuelle Zeile hervorheben
	set cursorline

	if &diff
		set lines=999
		set columns=999
	else
		set lines=35
		set columns=120
	endif

	set guifont=Ubuntu\ Mono\ 12

	" set foldcolumn=1
	
	" Fullscreen toggle
	map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
else
	" Farbschema bei vim
	" set background=dark
	colorscheme default
endif

if v:progname != "evim" && v:progname != "eview"
	" Splash-Screen deaktivieren
	set shortmess+=I

	" Toolbar deaktivieren
	set guioptions-=T

	" Scrollbalken deaktivieren
	set guioptions-=r
	set guioptions-=L

	" Maus deaktivieren
	" set mouse=c

	" Pfeiltasten deaktivieren
	" nnoremap <Left> :echoe "Use h"<CR>
	" nnoremap <Down> :echoe "Use j"<CR>
	" nnoremap <Up> :echoe "Use k"<CR>
	" nnoremap <Right> :echoe "Use l"<CR>
endif

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Backups deaktivieren
set nobackup

set autoindent
set ignorecase
filetype plugin indent on
set showcmd
set incsearch
