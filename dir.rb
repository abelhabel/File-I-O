file_names = Dir.glob("./*")

file_names.sort_by {|fname| File.size(fname) }

puts file_names

