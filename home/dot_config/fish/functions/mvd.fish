function mvd -d "Preview Markdown file on mdview.io"
    open "https://mdview.io/#mvd=zip:"(zip -q -j - $argv[1] | base64)
end
