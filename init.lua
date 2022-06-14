require("plugins")

vim.o.background = "dark"
vim.g.vscode_italic_comment = 1

vim.g.mapleader = " "

vim.cmd([[

set number
set tabstop=2
set shiftwidth=2
set scrolloff=3
set softtabstop=2
set expandtab
set mouse=a

colorscheme vscode

imap jk <Esc>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>e :NvimTreeFocus<CR>

nmap <Leader>ff :Telescope find_files<CR>
nmap <Leader>fs :Telescope live_grep<CR>

nmap <Leader>zz :TZAtaraxis<CR>

nmap <Leader>c :lua MiniBufremove.delete()<CR>
nmap <S-l> :bnext<CR>
nmap <S-h> :bprev<CR>
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
]])
