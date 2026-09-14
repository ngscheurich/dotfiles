function pi --description "Run pi via msb sandbox; --no-sandbox/-N runs pi directly"
  if test (count $argv) -ge 1; and contains -- "$argv[1]" --no-sandbox -N
    command pi $argv[2..-1]
  else
    msb run --conf "$HOME/.pi-sandbox/msb.yaml" -- pi $argv
  end
end
