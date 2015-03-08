set nocompatible
filetype plugin indent on

set nobackup
set noswapfile
set autoread

set hidden

set complete=.,w,b,t

" Tab width
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Search
set incsearch
set ignorecase smartcase
set hlsearch

" Encoding
set encoding=utf-8
set fencs=utf8,chinese,default

" Use sysetm clipboard
set clipboard+=unnamed

syntax on
set number

" Status line
set showcmd                                                         " show the inputing command
set laststatus=2                                                    " display status line always
set statusline=%F%m%r%h                                             " file path and modify status
set statusline+=%{(expand('#t')!='')?'\ <=>\ '.expand('#:t'):''}
set statusline+=\ %=\ %c\ %p%%\                                     " current directory
set statusline+=%{(&fenc!='')?'['.&fenc.']':''}                     " encoding
set statusline+=%{(&ff!='unix')?'['.&ff.']':''}                     " newline type

" Open help in new tab
cabbrev h tab help


"""""" Mapping """"""

let mapleader = ","

nnoremap Q qa<Esc>
nnoremap q @
nnoremap qq @a

" Up/down for auto wrap line
nnoremap j gj
nnoremap k gk

" Jump to matching pairs easily, with Tab
nmap <Tab> %
vmap <Tab> %

" Change directory to current file directory
nmap <Leader>cd :cd %:h<CR>:pwd<CR>

" Open current file directory
noremap <Leader>. :exec 'e '.expand('%:p:h')<CR>

nmap <Space>j }
nmap <Space>k {
nmap <Space>; f:
nmap <Space>w :call search('[A-Z]')<CR>
omap <Space>w :call search('[A-Z]')<CR>
nmap <Space>e f_
vmap <Space>e f_
omap <Space>e f_
nmap <Space>b F_
vmap <Space>b F_
omap <Space>b F_
nmap <Space><Space> :set list!<CR>

" Save and quit
nmap <Leader>q  <Esc>
nmap <Leader>qq  :q!<CR>
nmap <Leader>qa  :qa<CR>
nmap <Leader>w  :w!<CR>

nnoremap   <C-S>  :w!<CR>
vmap       <C-S>  <Esc><C-S>
imap       <C-S>  <C-O><C-S>

nnoremap   <C-Q>  :q!<CR>
vmap       <C-Q>  <Esc><C-Q>
imap       <C-Q>  <Esc><C-Q>
map        <A-F4> :qa!<CR>

" Tab nav
nnoremap   <C-T>   :tabnew<CR>
nnoremap   <C-H>   :tabprevious<CR>
nnoremap   <C-L>   :tabnext<CR>
imap       <C-T>   <Esc><C-T>
imap       <C-H>   <Esc><C-H>
imap       <C-L>   <Esc><C-L>


" Copy without newline char
nnoremap Y y$

" Select line (why not V?)
nnoremap <Leader>vv 0v$

" Copy/Delete/Replace all content
nnoremap yaa ggyG``
nnoremap daa ggdG
nnoremap caa ggVGp

" Close search highlighting
nnoremap <Leader>l :nohl<CR>
vnoremap <Leader>l <C-O>:nohl<CR>

" Code indent
nnoremap g= gg=G``
vnoremap g= =

" Search/Delete copied string
nnoremap <Leader>ss :call setreg('"', escape(getreg('"' ),'^$.*/\['))<CR>/<C-R>"<CR>
nmap <Leader>sd <Leader>ss:%s///g<CR>

" Search/Delete selected string
vmap * y<Leader>ss
vmap <Leader>sd *:%s///g<CR>

" Emacs like key binding
inoremap <C-A> <C-O>^
inoremap <C-E> <C-O>$
inoremap <C-K> <C-O>D
inoremap <C-B> <C-O>b
inoremap <C-F> <C-O>w

" Force saving files that require root permission
cmap w!! w !sudo tee > /dev/null %


""""" Command """"""

" JSON format
command! PJSON :%!python -m json.tool


""""" Filetype """"""

au Filetype js set ft=javascript
au Filetype rb set ft=ruby
au Filetype py set ft=python
au Filetype md set ft=markdown

au BufRead,BufNewFile *.rakefile set ft=ruby
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.json set ft=javascript

au Filetype markdown setlocal wrap linebreak nolist
au Filetype snippet setlocal noexpandtab
au Filetype python setlocal softtabstop=4 shiftwidth=4
