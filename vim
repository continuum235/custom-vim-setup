syntax on
set relativenumber

" -----------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Automatically close brackets, parentheses, and quotes
Plug 'jiangmiao/auto-pairs'
call plug#end()

filetype plugin indent on

" -----------------------------------------------------------------
" Indentation & Formatting
" -----------------------------------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" -----------------------------------------------------------------
" Key Mappings
" -----------------------------------------------------------------
inoremap jj <Esc>

" VS Code style completion:
" Use Tab to cycle next and confirm/insert the word if menu is open
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
" -----------------------------------------------------------------
" LSP & Completion Settings
" -----------------------------------------------------------------
set completeopt=menuone,noinsert,noselect,popup

let g:lsp_preview_float = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_async_completion = 1

" Explicitly bind omnifunc for Go buffers
augroup LspGoSetup
    autocmd!
    autocmd FileType go setlocal omnifunc=lsp#complete
augroup END

" Change cursor shape: thin vertical line in Insert mode, block in Normal mode
let &t_SI = "\e[5 q" " Insert mode: steady vertical line (bar)
let &t_SR = "\e[3 q" " Replace mode: steady underline
let &t_EI = "\e[2 q" " Normal/Visual mode: steady block
