(module config.core.abbrev
  {autoload {nvim aniseed.nvim
             u config.util}})

(u.iabbrev
  :facilty :facility
  :changset :changeset
  :InfieldPro :InFieldPro)

(u.cabbrev
  :Xa :xa
  :Qa :qa)
