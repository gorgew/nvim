return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        glslls = {
          cmd = {
            "glslls",
            "--stdin",
            "--target-env",
            "opengl",
          },
        },
      },
    },
  },

  {
    "tikhomirov/vim-glsl",
  },
}
