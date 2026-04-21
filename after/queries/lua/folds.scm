; extends
; Collapse runs of adjacent line comments into one fold range.
; `(comment)+` matches 1+ consecutive sibling comment nodes; `#make-range!`
; spans from the first's start to the last's end so the result is a single
; multi-line fold (single-line folds are otherwise discarded by foldexpr).
((comment)+ @fold
  (#make-range! "fold" @fold))
