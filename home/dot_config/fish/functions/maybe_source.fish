function maybe_source -d "Source a file if it exists" -a filepath
  if test -e "$filepath"
    source "$filepath"
  end
end
