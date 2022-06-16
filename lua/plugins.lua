local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require("packer").startup(function()
	use "wbthomason/packer.nvim"
  use "Mofiqul/vscode.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          generic_sorter = require('mini.fuzzy').get_telescope_sorter
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
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
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
    "echasnovski/mini.nvim",
    branch = "stable", 
    config = function()
      -- require("mini.base16").setup{
      --   palette = require("mini.base16").mini_palette('#112641', '#e2e98f', 75),
      --   name = 'minischeme',
      --   use_cterm = true,
      -- }
      require("mini.bufremove").setup{}
      require("mini.completion").setup{}
      require("mini.surround").setup{}
      require("mini.comment").setup{}
      require("mini.fuzzy").setup{}
      require("mini.pairs").setup{}
      require("mini.statusline").setup{}
      require("mini.tabline").setup{}
    end
  }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      require"lspconfig".sumneko_lua.setup{}
      require"lspconfig".eslint.setup{}
      require"lspconfig".tsserver.setup{}
      require"lspconfig".pyright.setup{}
      require"lspconfig".clangd.setup{}
    end
  }

  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require"nvim-lsp-installer".setup{}
    end
  }

  use {
    "ellisonleao/glow.nvim",
    branch = "main",
  }

	if packer_bootstrap then
		require("packer").sync()
	end
end)
