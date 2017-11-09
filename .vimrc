" set lang to en_us
set langmenu=en_us
set spelllang=en_us

" enable line numbers
set number

" disable vim welcome message
set shortmess=I

"always show editing mode
set showmode

" optimize searches
set hlsearch
set incsearch                  

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Enable syntax highlighting
syntax enable 

" try to set new color scheme
try
    colorscheme jellybeans
catch
endtry
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" 1 tab -> 4 spaces
set tabstop=4
