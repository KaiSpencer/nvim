syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set rnu
set incsearch
set termguicolors
set smartcase
set cmdheight=2
set updatetime=50


call plug#begin()
Plug 'scrooloose/nerdTree'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/indentpython.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-treesitter/nvim-treesitter'

" Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

"Colour stuff
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', {'rtp': 'vim/'}



call plug#end()

let g:gruvbox_contrast_dark = 'hard'
let g:airline_theme='gruvbox'
colorscheme gruvbox  

"NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.')j- 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"Ctr p speed increase
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

let mapleader = ' '
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>n Go
tnoremap <Esc> <C-\><C-n>


"Tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"Telescope issue open, git files working only

"nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
"nnoremap <Leader>f :lua require'telescope.builtin'.git_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.git_files{}<CR>
"noremap <Leader>en <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
"nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>


nnoremap <silent>vs :vsplit<enter><CR>  
nnoremap <silent>hs :split<enter><CR>
nnoremap <leader>t :vsplit <bar> :wincmd l <bar> :terminal <CR>

" Open nvimrc file
nnoremap <Leader>v :vsp ~/.config/nvim/init.vim<CR>
" Source nvimrc file
nnoremap <Leader>sv :source ~/.config/nvim/init.vim<CR>
