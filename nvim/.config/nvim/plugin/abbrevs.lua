-- =========================================================
-- Abbreviations
-- =========================================================

local abbrev = ngs.abbrev

-- Insert mode
abbrev("i", {
  {"facilty", "facility"}
})

-- Command-line mode
abbrev("c", {
  {"Xa", "xa"},
  {"Qa", "qa"},
})
