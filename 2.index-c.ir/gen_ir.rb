unless File.directory?("index-c")
  `git clone https://github.com/kostya/index-c.git`
end

t = Time.now
file = "index-c.ll"
cmd = "clang -S -emit-llvm index-c/index.c -o #{file}"
`#{cmd}`

content = File.read(file)
content.gsub!(/^; Function Attrs:.*?\n/, '')    
content.gsub!(/\) #\d+ \{/, ') {')
content.gsub!(/^attributes #\d+ = {.*?}\n/m, '')
content.gsub!(/\) #\d+/, ')')
File.write(file, content)

puts "generated to #{file} in #{Time.now - t}"

t = Time.now
file = "index-c.myc"
cmd = "mycc m --debug index-c/index.c > index-c.myc"
`#{cmd}`

puts "generated to #{file} in #{Time.now - t}s"
