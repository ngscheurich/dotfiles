-- ===================================================================
--  Conjure
-- -------------------------------------------------------------------
--  https://github.com/Olical/conjure
--  Conversational software development
--  misc
-- -------------------------------------------------------------------
return {
  "Olical/conjure",

  ft = { "fennel", "lua", "python", "rust" },

  init = function()
    vim.g["conjure#mapping#doc_word"] = "<LocalLeader>k"
  end,
}
