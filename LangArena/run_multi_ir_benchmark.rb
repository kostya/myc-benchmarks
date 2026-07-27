require File.join(__dir__, 'shared')
compile_h = {}
output_h = {}

puts "----------------------------- Compile clang LL files -----------------------------------------------"

rm_dir("./target/multi-ll-objs")
touch_dir("./target/multi-ll-objs")

LLS = Dir.glob("langarena-lls/**/*.ll")

def compile_clang_ll(flags, output, build_dir)
  touch_dir("./target/multi-ll-objs/#{build_dir}")
  measure do
    objs = []
    LLS.each do |ll|
      obj = "./target/multi-ll-objs/#{build_dir}/" + File.basename(ll) + ".o"
      cmd = "clang #{flags} #{ll} -c -o #{obj}"
      run_cmd cmd
      objs << obj
    end
    cmd = "clang #{LINK_FLAGS} #{objs.join(" ")} -o #{output}"
    run_cmd cmd
  end
end

CLANG_OPTS =   [
  {
    "name" => "clang(-O3, ll)",
    "opts" => ["-O3", "./target/multi_clang_o3", "o3"],
  },
  {
    "name" => "clang(-O2, ll)",
    "opts" => ["-O2", "./target/multi_clang_o2", "o2"],
  },
  {
    "name" => "clang(-O1, ll)",
    "opts" => ["-O1", "./target/multi_clang_o1", "o1"],
  },
  {
    "name" => "clang(-O0, ll)",
    "opts" => ["-O0", "./target/multi_clang_o0", "o0"],
  },
]

CLANG_OPTS.each do |h|
  puts "Compile clang ll #{h["name"]}"
  compile_h[h["name"]] = compile_clang_ll(*h["opts"])
  output_h[h["name"]] = h["opts"][1]
end


puts "----------------------------- Compile Myc IR files -----------------------------------------------"
rm_dir("./target/multi-myc-objs")
touch_dir("./target/multi-myc-objs")

MYCS = Dir.glob("langarena-mycs/**/*.myc")

def compile_myc(backend, output, flag, build_dir)
  touch_dir("./target/multi-myc-objs/#{build_dir}")
  measure do
    objs = []
    MYCS.each do |ll|
      obj = "./target/multi-myc-objs/#{build_dir}/" + File.basename(ll) + ".o"
      cmd = "myc-#{backend} o #{flag} #{ll} #{obj}"
      run_cmd cmd
      objs << obj
    end
    cmd = "MYC_LINKER_FLAGS='#{LINK_FLAGS}' myc-#{backend} #{objs.join(" ")} c #{output}"
    run_cmd cmd
  end
end

OPTS = [
  {
    "name" => "myc-llvm(default)",
    "opts" => ["llvm", "./target/multi_myc_llvm_default", "", "llvm-default"],
  },
  {
    "name" => "myc-llvm(final)",
    "opts" => ["llvm", "./target/multi_myc_llvm_final", "--final", "llvm-final"],
  },
  {
    "name" => "myc-qbe(default)",
    "opts" => ["qbe", "./target/multi_myc_qbe_default", "", "qbe-default"],
  },
  {
    "name" => "myc-c(default, clang)",
    "opts" => ["c", "./target/multi_myc_c_default", "", "c-default"],
  },
  {
    "name" => "myc-c(final, clang)",
    "opts" => ["c", "./target/multi_myc_c_final", "--final", "c-final"],
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
