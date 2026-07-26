require File.join(__dir__, 'shared')
compile_h = {}
output_h = {}

puts "----------------------------- Compile clang LL files -----------------------------------------------"

def compile_clang_ll(flags, output)
  measure do
    File.delete(output) rescue nil
    cmd = "clang #{flags} langarena-single-ll/langarena.ll #{LINK_FLAGS} -o #{output}"
    run_cmd cmd
  end
end

CLANG_OPTS =   [
  {
    "name" => "clang(-O3, ll)",
    "opts" => ["-O3", "./binaries/single_clang_o3"],
  },
  {
    "name" => "clang(-O1, ll)",
    "opts" => ["-O1", "./binaries/single_clang_o2"],
  },
  {
    "name" => "clang(-O2, ll)",
    "opts" => ["-O2", "./binaries/single_clang_o1"],
  },
  {
    "name" => "clang(-O0, ll)",
    "opts" => ["-O0", "./binaries/single_clang_o0"],
  },
]

CLANG_OPTS.each do |h|
  puts "Compile clang ll #{h["name"]}"
  compile_h[h["name"]] = compile_clang_ll(*h["opts"])
  output_h[h["name"]] = h["opts"][1]
end


puts "----------------------------- Compile Myc IR files -----------------------------------------------"

def compile_myc(backend, output, flag)
  measure do
    File.delete(output) rescue nil
    cmd = "MYC_LINKER_FLAGS='#{LINK_FLAGS}' myc-#{backend} langarena-single-myc/langarena.myc c #{output} #{flag}"
    run_cmd cmd
  end
end

OPTS = [
  {
    "name" => "myc-llvm(default)",
    "opts" => ["llvm", "./binaries/single_myc_llvm_default", ""],
  },
  {
    "name" => "myc-llvm(final)",
    "opts" => ["llvm", "./binaries/single_myc_llvm_final", "--final"],
  },
  {
    "name" => "myc-qbe(default)",
    "opts" => ["qbe", "./binaries/single_myc_qbe_default", ""],
  },
  {
    "name" => "myc-c(default, clang)",
    "opts" => ["c", "./binaries/single_myc_c_default", ""],
  },
  {
    "name" => "myc-c(final, clang)",
    "opts" => ["c", "./binaries/single_myc_c_final", "--final"],
  },
]

OPTS.each do |h|
  puts "Compile MYC #{h["name"]}"
  compile_h[h["name"]] = compile_myc(*h["opts"])
  output_h[h["name"]] = h["opts"][1]
end


puts "----------------------------- Run benchmark -----------------------------------------------"
run_h = {}

def run(binary)
  c = "#{binary} ./run.js"
  res = `#{c}`
  line = res.split("\n").find { |l| l.include?("Summary") }
  if line && line.include?("50, 50, ") && line =~ /Summary:\s*(\d+\.\d+)s/
    delta = $1.to_f
    puts "OK in #{delta}"
    delta
  else
    raise "ERROR #{line}"
  end
end

output_h.each do |name, output|
  begin
    puts "Run #{name} #{output}"
    run_h[name] = run(output)
  rescue => ex
    p ex
  end
end

p compile_h
p run_h

puts "----------------------------- Run finished -----------------------------------------------"

def markdown_table(build_times, run_times)
  output = []
  output << "| Compiler | Build time | Runtime |"
  output << "|:-------|-------------:|-----:|"

  build_times.each do |compiler, time|
    if run_times[compiler]
      ms = (time * 1000).round
      run = "#{run_times[compiler].round(1)}s"
      output << "| #{compiler} | #{ms}ms | #{run} |"
    end
  end

  output.join("\n")
end

puts
puts markdown_table(compile_h, run_h)
