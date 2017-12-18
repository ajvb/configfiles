""" Plugin Manager: https://github.com/junegunn/vim-plug
" Plugins {{{
call plug#begin('~/.vim/plugged')
" General Code Formatting
Plug 'scrooloose/syntastic'                 " Syntax checkers
Plug 'kien/rainbow_parentheses.vim'         " parentheses pretty highlighting
" Plug 'Valloric/YouCompleteMe'

" terraform formatting
Plug 'markcornick/vim-terraform'
"Plug 'fatih/vim-hclfmt'

" git
Plug 'tpope/vim-fugitive'

" sql
Plug 'vim-scripts/SQLUtilities'

" alignment
Plug 'junegunn/vim-easy-align'

" Status/tabline
Plug 'bling/vim-airline'

" Go
Plug 'fatih/vim-go'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'Chiel92/vim-autoformat'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Rails
Plug 'tpope/vim-rails'

" Puppet
Plug 'rodjek/vim-puppet'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Colors
Plug 'junegunn/seoul256.vim'
"Plug 'dylanaraps/wal'

" Ack
Plug 'mileszs/ack.vim'

" Javascript
Plug 'pangloss/vim-javascript'

" C/C++
Plug 'WolfgangMehner/c-support'

call plug#end()
" }}}

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"
" Syntastic
"
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Synastic doesn't check Go files on save by default (anymore), this restores that behaviour
let g:syntastic_go_checkers = ['govet', 'errcheck']
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" colors
let g:seoul256_background = 233
colo seoul256
set background=dark
"colorscheme wal

" Rust formatting and such
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
let g:rustfmt_autosave = 1
au BufWrite *.rc :Autoformat

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let mapleader = ","

set hlsearch        " highlight searches
set showmatch		" show matching brackets.
set ignorecase		" do case insensitive matching
set smartcase		" do smart case matching
set incsearch		" incremental search
set autowrite		" automatically save before commands like :next and :make
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" Add line numbers
set number

" Auto complete for :e

"make that backspace key work the way it should
set backspace=indent,eol,start
"this is for 2-space indenting
set tabstop=2
set shiftwidth=2
set expandtab
set hidden

" configuring folding
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20
"make space more useful
nnoremap <space> za

"key mappings
map <c-d> dd
map - ddp
map _ ddkkp
map <c-u> <esc><c-v>eu

""insert mode key mappings
imap <c-u> <esc>ui
imap <c-q> <esc>w
imap <c-e> <esc><s-v>
imap <c-s-w> <esc><c-w><c-w>

" and make them work, too.
nnoremap j gj
nnoremap k gk

" clear highlighted searches
nmap <silent> ,/ :nohlsearch<cr>

""""""""""""""""
"  utility stuff
""""""""""""""""
" diff
nmap <leader>d :!git diff %<cr>

" sudo to write
cmap w!! w !sudo tee % >/dev/null

""""""""""""""""""
"  language stuff
""""""""""""""""""
au bufnewfile,bufread *.less set filetype=less
au bufread,bufnewfile *.scss set filetype=scss
au bufnewfile,bufread *.hbs set filetype=html
au bufnewfile,bufread *.md set filetype=markdown
au bufnewfile,bufread *.m*down set filetype=markdown
au bufnewfile,bufread *.md nnoremap <leader>1 yypvr=
au bufnewfile,bufread *.md nnoremap <leader>2 yypvr-
au bufnewfile,bufread *.md nnoremap <leader>3 i### <esc>
au bufread,bufnewfile *.go set filetype=go
au bufnewfile,bufread *.less set foldmethod=marker
au bufnewfile,bufread *.less set filetype=less
au bufnewfile,bufread *.less set foldmarker={,}
au bufnewfile,bufread *.less set nocursorline
au bufread,bufnewfile /etc/nginx/conf/* set ft=nginx
au bufread,bufnewfile /etc/nginx/sites-available/* set ft=nginx
au bufread,bufnewfile /usr/local/etc/nginx/sites-available/* set ft=nginx

" rainbows!
au syntax * RainbowParenthesesLoadRound
au syntax * RainbowParenthesesLoadSquare
au syntax * RainbowParenthesesLoadBraces

" disable useless html5 junk
let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

"  get more python highlighting
au filetype python syn keyword pythondecorator true none false self
" allow nesting of docstring style quotes
au filetype python let b:delimitmate_nesting_quotes = ['"']

"""""""""""
" wildmenu completion {{{
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                       " version control
set wildignore+=*.aux,*.out,*.toc                   " latex intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,   " compiled object files
set wildignore+=*.spl                               " compiled spelling word lists
set wildignore+=*.sw?                               " vim swap files
set wildignore+=*.ds_store                          " osx bullshit
set wildignore+=*.jar,*.class                       " java bullshit
set wildignore+=*.luac                              " lua byte code
set wildignore+=migrations                          " django migrations
set wildignore+=*.pyc                               " python byte code
set wildignore+=*.orig                              " merge resolution files

"""" Some stuff for Python | From: http://justinlilly.com/vim/vim_and_python.html
au FileType py set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
au FileType py set textwidth=79 " PEP-8 Friendly

"""" Shift W/Q should work
command! W :w
command! Q :q
command! WQ :wq
command! Wq :wq

" Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Fuzzy finder
map <Leader>f  :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

let g:python_host_prog='/Library/Frameworks/Python.framework/Versions/2.7/bin/python'

" For Align
set nocp
filetype plugin on

" Tab configuration
map gb gT
