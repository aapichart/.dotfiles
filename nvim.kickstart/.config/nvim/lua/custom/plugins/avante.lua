local ollama_endpoing = os.getenv 'OLLAMA_END_POINT'
return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  build = 'make',
  opts = {
    provider = 'ollama',
    providers = {
      ollama = {
        ['local'] = true,
        endpoint = 'http://10.133.70.14:11434/v1',
        -- endpoing = os.getenv 'OLLAMA_END_POINT',
        model = 'deepseek-v3.1:671b-cloud',
        api_key_name = '', -- Must be present even if empty for local models
        __inherited_from = 'openai', -- Simplifies config and prevents "missing field" errors
      },
    },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua',
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
