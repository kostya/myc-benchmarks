require File.join(__dir__, 'shared')

FileUtils.mkdir_p("./langarena-mycs")

files = []
myc_time = measure do 
  SOURCES.each do |source|
    out = "langarena-mycs/#{File.basename(source)}.myc"
    files << out
    cmd = "MYC_DISABLE_INLINER=1 MYCC_INCLUDE=#{INCLUDES_STR_MYC} mycc d #{source} > #{out}"
    run_cmd(cmd)
  end
end

puts "generated #{SOURCES.size} files in #{myc_time}s"

FileUtils.mkdir_p("./langarena-single-myc")

myc_time = measure do 
  cmd = "MYC_DISABLE_INLINER=1 myc-llvm langarena-mycs/*.myc m > ./langarena-single-myc/langarena.myc"
  run_cmd(cmd)
end

puts "generated single ./langarena-single-myc/langarena.myc in #{myc_time}s"
