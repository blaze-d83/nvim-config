return {
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,
        numhl      = false,
        linehl     = false,
        word_diff  = false,
        watch_gitdir = {
          follow_files = true
        },
        attach_to_untracked     = false,
        current_line_blame      = false,
        current_line_blame_formatter = function(name, blame_info)
          return string.format('%s, %s - %s', blame_info.author, os.date('%Y-%m-%d', blame_info.author_time), blame_info.summary)
        end,
        sign_priority    = 6,
        update_debounce  = 100,
        status_formatter = nil,
        max_file_length  = 40000,
        preview_config   = {
          border         = 'single',
          style          = 'minimal',
          relative       = 'cursor',
          row            = 0,
          col            = 1
        },
      }
    end
  }
}

