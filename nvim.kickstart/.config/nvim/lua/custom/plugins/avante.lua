local ollama_endpoing = os.getenv 'OLLAMA_END_POINT'
return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- pull latest changes
  build = 'make',
  opts = {
    provider = 'ollama',
    providers = {
      ollama = {
        -- ['local'] = true,
        endpoint = 'http://192.168.56.3/',
        -- endpoing = os.getenv 'OLLAMA_END_POINT',
        model = 'llama3.1:latest',
        -- model = 'deepseek-v3.1:671b-cloud',
        api_key_name = '', -- Must be present even if empty for local models
        -- __inherited_from = 'openai', -- Simplifies config and prevents "missing field" errors
        parse_curl_args = function(_, code_opts)
          return {
            url = 'http://192.168.56.3/chat/completions',
            headers = {
              ['Content-Type'] = 'application/json',
            },
            body = {
              model = 'llama3.1:latest',
              messages = require('avante.providers').openai.parse_messages(code_opts),
              stream = true,
              temperature = 0,
            },
          }
        end,
        parse_response_data = function(data_stream, event_state, opts)
          require('avante.providers').openai.parse_response(data_stream, event_state, {
            model = 'llama3.1:latest',
          })
        end,
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
