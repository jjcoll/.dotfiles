local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Failed to require packer")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "phanviet/vim-monokai-pro" -- monokai pro
  use "navarasu/onedark.nvim" -- onedark
  use "folke/tokyonight.nvim"
  use "savq/melange"
  use "EdenEast/nightfox.nvim"
  use "sainnhe/sonokai"
  use "bluz71/vim-moonfly-colors"
  use "jacoborus/tender.vim"
  -- Transparency
  use "xiyaowong/nvim-transparent"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lua" -- nvim config completion
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions for cmp

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  -- use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use {
    {
        "williamboman/nvim-lsp-installer", -- first lsp-installer
    },
    {
        "neovim/nvim-lspconfig",
    }
  }
  -- Null-ls (formatting, linting etc.)
  use "jose-elias-alvarez/null-ls.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "andymass/vim-matchup"

  -- Git Signs
  use "lewis6991/gitsigns.nvim"

  -- Autoclosing () [] {} " ""
  use "windwp/nvim-autopairs" -- Auto closing pairs, integrates with cmp and Treesitter

  -- Commenting
  use "numToStr/Comment.nvim" -- Easily comment stuf
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Context aware commenting for Treesitter (in jsx will know html or js etc.)

  -- Tree explorer
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye" -- fixes closing buffers and exiting nvim

  -- Markdown previewer
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Clearly show indents
  -- use "Yggdroot/indentLine" -- no other config
  use "lukas-reineke/indent-blankline.nvim"

  -- Surround (rename <> surround with () all made easier)
  use "tpope/vim-surround"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


