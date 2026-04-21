; extends
((line_comment)+ @fold
  (#make-range! "fold" @fold))
(block_comment) @fold
