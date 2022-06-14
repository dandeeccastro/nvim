local fn = vim.fn 
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require("packer").startup(function()
	use "wbthomason/packer.nvim"
	use "Mofiqul/vscode.nvim"
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					theme = "vscode",
				}
			})
		end
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {"c","lua","rust","javascript"},
				sync_install = false,
				highlight = {
					enable = true,
				}
			})
		end
	}

	use {
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({
				default_mappings = true,
				builtin_marks = {".","<",">","^"},
				cyclic = true,
				force_write_shada = true,
				refresh_interval = 250,
				sign_priority = {
					lower = 10,
					upper = 15,
					builtin = 8,
					bookmark = 20,
				},
				excluded_filetypes = {},
				bookmark_0 = {
					sign = "⚑",
					virt_text = "Salve",
				},
				mappings = {},
			})
		end
	}

	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require("bufferline").setup()
		end
	}

	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}

	use {
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	}

	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end
	}

	use {
		"Pocco81/TrueZen.nvim",
		config = function()
			require("true-zen").setup({
				ui = {
					bottom = {
						laststatus = 0,
						ruler = false,
						showmode = false,
						showcmd = false,
						cmdheight = 1,
					},
					top = {
						showtabline = 0,
					},
					left = {
						number = false,
						relativenumber = false,
						signcolumn = "no",
					},
				},
				modes = {
					ataraxis = {
						left_padding = 32,
						right_padding = 32,
						top_padding = 1,
						bottom_padding = 1,
						ideal_writing_area_width = {0},
						auto_padding = true,
						keep_default_fold_fillchars = true,
						custom_bg = {"none", ""},
						bg_configuration = true,
						quit = "untoggle",
						ignore_floating_windows = true,
						affected_higroups = {
							NonText = true,
							FoldColumn = true,
							ColorColumn = true,
							VertSplit = true,
							StatusLine = true,
							StatusLineNC = true,
							SignColumn = true,
						},
					},
					focus = {
						margin_of_error = 5,
						focus_method = "experimental"
					},
				},
				integrations = {
					gitsigns = false,
					nvim_bufferline = false,
					lualine = false,
				},
				misc = {
					on_off_commands = false,
					ui_elements_commands = false,
					cursor_by_mode = false,
				}
			})
		end
	}

	use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
		config = function()
			require("nvim-tree").setup()
		end,
    tag = 'nightly'
}

	use {
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("telescope").setup({})
		end
	}

  use {
    "echasnovski/mini.nvim",
    branch = "stable", 
    config = function()
      require("mini.completion").setup{}
    end
  }

 use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require"nvim-lsp-installer".setup{}
    end
  } 

  use {
    "neovim/nvim-lspconfig",
    after = "nvim-lsp-installer", 
    config = function()
      require"lspconfig".sumneko_lua.setup{}
      require"lspconfig".eslint.setup{}
      require"lspconfig".tsserver.setup{}
      require"lspconfig".pyright.setup{}
    end
  }

	if packer_bootstrap then
		require("packer").sync()
	end
end)
