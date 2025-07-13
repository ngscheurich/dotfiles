return {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
  ["nil"] = {
    formatting = {
      command = { "nixfmt" },
    },
  },
}
