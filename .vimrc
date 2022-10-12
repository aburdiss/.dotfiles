" Alexander Burdiss .vimrc
" Last Modified 10/12/22

" Appearance
colorscheme codedark 
syntax on
set colorcolumn=80
set number
set relativenumber
set scrolloff=6

" netrw settings
" Set the list to be a tree view
let g:netrw_liststyle = 3
" Set line numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_banner = 0

" Mode Settings
" The following works with Apple default terminal only
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
" The following works with iTerm2
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Cursor settings:
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" Code Settings 
" Indenting. Use 2 spaces and be smart about it where you can.
set smartindent
set tabstop=2 softtabstop=2
set shiftwidth=2
" Use spaces when you hit the tab key
set expandtab
" Automatically read files when they are updated and open in Vim
set autoread

" Incremental Search
set incsearch
" Highlight Search
set hlsearch

" Remaps
let mapleader = " "
" Source vimrc with space+enter
nnoremap <leader><CR> :so ~/.vimrc<CR>
" Open vertical explore with space pv
nnoremap <leader>pv :Vex<CR>
" Delete but don't put contents into any registers.
nnoremap <leader>d "_d
" Replace current content and don't put anything into registers
vnoremap <leader>p "_dP

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J ddp
nnoremap K ddkP

" Plugin specific settings
" fzf
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" ALE
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
" Fix with Option-Shift-F (Binding from VSCode)
nnoremap <A-Ï> :ALEFix<CR>
" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
