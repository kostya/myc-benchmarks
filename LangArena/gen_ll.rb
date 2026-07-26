require File.join(__dir__, 'shared')

FileUtils.mkdir_p("./langarena-lls")

files = []
ll_time = measure do 
  SOURCES.each do |source|
    out = "langarena-lls/#{File.basename(source)}.ll"
    files << out
    cmd = "clang -S -emit-llvm #{INCLUDES_STR_CC} #{source} -o #{out}"
    run_cmd(cmd)
  end
end

puts "generated #{SOURCES.size} files in #{ll_time}s"

# clean attributes
files.each do |file|
  content = File.read(file)
  content.gsub!(/^; Function Attrs:.*?\n/, '')    
  content.gsub!(/\) #\d+ \{/, ') {')
  content.gsub!(/^attributes #\d+ = {.*?}\n/m, '')
  content.gsub!(/\) #\d+/, ')')
  File.write(file, content)
end

FileUtils.mkdir_p("./langarena-single-ll")

ll_time = measure do 
  cmd = "llvm-link #{files.join(" ")} -S -o ./langarena-single-ll/langarena.ll"
  run_cmd(cmd)
end

puts "generated single ./langarena-single-ll/langarena.ll in #{ll_time}s"
