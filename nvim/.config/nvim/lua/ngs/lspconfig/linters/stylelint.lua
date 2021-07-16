return {
  sourceName= "stylelint",
  command = "npx",
  args = {"stylelint", "--formatter", "json"},
  rootPatterns = {".stylelintrc.js"},
  debounce = 100,
  parseJson = {
   errorsRoot = "[0].warnings",
    line = "line",
    column = "column",
    security = "severity",
    message = "${text}",
  },
  securities = {
    error = "error",
    warning = "warning",
  }
}
