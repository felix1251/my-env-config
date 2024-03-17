 local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'Mofiqul/vscode.nvim'
  use {
    'akinsho/bufferline.nvim', 
    tag = "*", 
    requires = 'nvim-tree/nvim-web-devicons'
  } 
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'eandrju/cellular-automaton.nvim'  
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- use 'neovim/nvim-lspconfig'
  -- use 'williamboman/nvim-lsp-installer'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
