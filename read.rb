require 'open-uri'

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
text_file = 'hamlet.txt'
def write(save_as, url)
  File.open(save_as, "w"){ |file| file.write(open(url).read)}

  File.open(save_as, "r") do |file|
   file.readlines.each_with_index do |line, idx|
      puts line if idx % 42 == 41
   end   
end
end

# write(text_file, url)
# puts open(url).readlines

def find_hamlet_lines(text_file)
  is_hamlet_speaking = false
  File.open("hamlet.txt", "r") do |file|
   file.readlines.each do |line|

      if is_hamlet_speaking == true && ( line.match(/^  [A-Z]/) || line.strip.empty? )
        is_hamlet_speaking = false
      end

      is_hamlet_speaking = true if line.match("Ham\.")

      puts line if is_hamlet_speaking == true
   end   
  end
end
find_hamlet_lines(text_file)