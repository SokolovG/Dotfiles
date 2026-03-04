require("nvim-tree").setup({
  filters = {
    git_ignored = true,
    custom = { "__pycache__", "*.pyc", "*.pyo", ".venv", "venv" },
    dotfiles = false,
  }
})
