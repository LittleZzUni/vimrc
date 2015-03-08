
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
