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
nmap <Leader>e :NvimTreeFocus<CR>
nmap <Leader>ff <cmd>Telescope find_files<CR>
nmap <Leader>fs <cmd>Telescope live_grep<CR>
nmap <S-l> :BufferLineCycleNext<CR>
nmap <S-h> :BufferLineCyclePrev<CR>
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
]])

require("plugins")
