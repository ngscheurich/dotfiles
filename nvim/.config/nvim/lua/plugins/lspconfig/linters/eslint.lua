return {
  command = "npx",
  args = {"eslint", "--stdin", "--format", "json"},
  debounce = 100,
  sourceName= "eslint",
  parseJson = {
   errorsRoot = "[0].messages",
    line = "line",
    column = "column",
    security = "severity",
    message = "${message} [${ruleId}]",
  },
  securities = {
    ["1"] = "warning",
    ["2"] = "error",
  }
}
