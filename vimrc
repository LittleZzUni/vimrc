
" 备份
set nobackup
set noswapfile                 " 禁用交换文件
set autoread                   " 当文件在外部被修改，自动更新该文件

set hidden

" 关键字补全
set complete=.,w,b,t

" 字符表
set tabstop=2                  " tab宽度
set softtabstop=2              " 退格删除的空格数目
set shiftwidth=2               " 缩进宽度
set expandtab                  " 展开tab为空格
set autoindent

" 搜索
set incsearch                  " 实时搜索
set ignorecase smartcase       " 忽略大小写
set hlsearch                   " 高亮查找结果

" 语言与编码
set encoding=utf-8
set fencs=utf8,chinese,default

set clipboard+=unnamed         " 使用系统剪贴版

" 显示
syntax on                    " 语法高亮
set number                   " 行号
set cursorline               " 高亮当前行

" 状态拦
set showcmd                      " 显示正在输入的命令
set laststatus=2                 " 总是显示状态栏
set statusline=%F%m%r%h          " 文件路径与状态
set statusline+=%{(expand('#t')!='')?'\ <=>\ '.expand('#:t'):''}
set statusline+=\ %=\ %c\ %p%%\  " 当前位置
set statusline+=%{(&fenc!='')?'['.&fenc.']':''}     " 文件编码
set statusline+=%{(&ff!='unix')?'['.&ff.']':''}     " 显示换行符类型

" 在单独的标签页打开帮助
cabbrev h tab help


" Mapping

" 设置','为Leader快捷键
let mapleader = ","

noremap <C-C> <Esc>
noremap <C-[> <C-C>

nnoremap Q qa<Esc>
nnoremap q @
nnoremap qq @a

" 文本自动换行时, gj 为在视觉上的一行
nnoremap j gj
nnoremap k gk

" Jump to matching pairs easily, with Tab
nmap <Tab> %
vmap <Tab> %

" 切换vim目录到当前文件所在目录
nmap <Leader>cd :cd %:h<CR>:pwd<CR>

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

" 快速保存和退出
nmap <Leader>q  <Esc>
nmap <Leader>qq  :q!<CR>
nmap <Leader>qa  :qa<CR>
nmap <Leader>w  :w!<CR>
nmap <Leader>Wu :set fenc=utf-8<CR>:w!<CR>
nmap <Leader>Wc :set fenc=cp936<CR>:w!<CR>

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

" 复制粘贴
nnoremap Y y$
nnoremap <Leader>vv 0v$
nnoremap yaa ggyG``
nnoremap daa ggdG
nnoremap caa ggVGp

nnoremap <Leader>l :nohl<CR>   " 关闭当前搜索高亮
vnoremap <Leader>l <C-O>:nohl<CR>
" 前往下一个搜索结果
map <F3> :cnext<CR>
map <S-F3> :cprevious<CR>

" 代码缩进
nnoremap g= gg=G``
vnoremap g= =

" 跳转到关键字
" nf: next function
" ns: next style/script tag
" na: next javascript object key
noremap <Leader>nf :/\<function\><CR>
noremap <Leader>ns :/<\zs\(style\|script\)<CR>
noremap <Leader>na :/^\s*\zs\(\w\+\\|\(["']\).\+\2\)\ze\s*:<CR>

" 搜索选中的文本
nnoremap <Leader>ss :call setreg('"', escape(getreg('"' ),'^$.*/\['))<CR>/<C-R>"<CR>
vmap * y<Leader>ss
nmap <Leader>sd <Leader>ss:%s///g<CR>
vmap <Leader>sd *:%s///g<CR>


" 文本编辑快捷键
" <C-U> <C-W>  保持默认值，不使用<C-H>
inoremap <C-A> <C-O>^
inoremap <C-E> <C-O>$
inoremap <C-J> <C-O>o
inoremap <C-K> <C-O>D
inoremap <C-B> <C-O>b
inoremap <C-F> <C-O>w
inoremap <C-R><Space> <C-R>"

" Open current file directory
noremap <Leader>. :exec 'e '.expand('%:p:h')<CR>

" Command

command! PJSON :%!python -m json.tool


" Filetype

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
