return {
  command = "npx",
  rootPatterns = {".stylelintrc.js"},
  debounce = 100,
  args = {"stylelint", "--formatter", "json"},
  sourceName= "stylelint",
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
