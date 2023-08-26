return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        glslls = {
          cmd = {
            "glsllls",
            "--stdin",
            "--target-env",
            "opengl",
          },
        },
      },
    },
  },
}
