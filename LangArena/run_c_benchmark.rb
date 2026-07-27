require File.join(__dir__, 'shared_bench')

puts "----------------------------- Gen IR files -----------------------------------------------"
gen_h = {}
compile_h = {}
output_h = {}

puts "----------------------------- Compile Mycc c files -----------------------------------------------"

def compile_mycc(flag, output)
  File.delete(output) rescue nil
  measure do
    cmd = "CC=clang MYC_LINKER_FLAGS='#{LINK_FLAGS}' MYCC_INCLUDE='#{INCLUDES_STR_MYC}' mycc c #{flag} c/src/*.c c/main.c -o #{output}"
    run_cmd cmd
  end
end

MYCC =   [
  {
    "name" => "mycc(default, llvm)",
    "opts" => ["--backend llvm", "./target/mycc_llvm_default"],
  },
  {
    "name" => "mycc(final, llvm)",
    "opts" => ["--backend llvm --final", "./target/mycc_llvm_final"],
  },
  {
    "name" => "mycc(default, qbe)",
    "opts" => ["--backend qbe", "./target/mycc_qbe_default"],
  },
  {
    "name" => "mycc(default, c, clang)",
    "opts" => ["--backend c", "./target/mycc_c_default"],
  },
  {
    "name" => "mycc(final, c, clang)",
    "opts" => ["--backend c --final", "./target/mycc_c_final"],
  },
]

MYCC.each do |h|
  puts "Compile mycc #{h["name"]}"
  compile_h[h["name"]] = compile_mycc(*h["opts"])
  output_h[h["name"]] = h["opts"][1]
end

puts "----------------------------- Compile clang C files -----------------------------------------------"

def compile_clang_c(flags, output)
  File.delete(output) rescue nil
  measure do
    cmd = "clang #{flags} #{INCLUDES_STR_CC} c/src/*.c c/main.c #{LINK_FLAGS} -o #{output}"
    run_cmd cmd
  end
end

CLANG_OPTS_C =   [
  {
    "name" => "clang(-O3, c)",
    "opts" => ["-O3", "./target/c_clang_o3"],
  },
  {
    "name" => "clang(-O2, c)",
    "opts" => ["-O2", "./target/c_clang_o2"],
  },
  {
    "name" => "clang(-O1, c)",
    "opts" => ["-O1", "./target/c_clang_o1"],
  },
  {
    "name" => "clang(-O0, c)",
    "opts" => ["-O0", "./target/c_clang_o0"],
  },
]

CLANG_OPTS_C.each do |h|
  puts "Compile clang c #{h["name"]}"
  compile_h[h["name"]] = compile_clang_c(*h["opts"])
  output_h[h["name"]] = h["opts"][1]
end

puts "----------------------------- Compile gcc -----------------------------------------------"


def compile_gcc_c(flags, output)
  File.delete(output) rescue nil
  measure do
    cmd = "gcc #{flags} #{INCLUDES_STR_CC} c/src/*.c c/main.c #{LINK_FLAGS} -o #{output}"
    run_cmd cmd
  end
end

GCC_OPTS_C =   [
  {
    "name" => "gcc(-O3, c)",
    "opts" => ["-O3", "./target/c_gcc_o3"],
  },
  {
    "name" => "gcc(-O2, c)",
    "opts" => ["-O2", "./target/c_gcc_o2"],
  },
  {
    "name" => "gcc(-O1, c)",
    "opts" => ["-O1", "./target/c_gcc_o1"],
  },
  {
    "name" => "gcc(-O0, c)",
    "opts" => ["-O0", "./target/c_gcc_o0"],
  },
]

GCC_OPTS_C.each do |h|
  puts "Compile gcc c #{h["name"]}"
  compile_h[h["name"]] = compile_gcc_c(*h["opts"])
  output_h[h["name"]] = h["opts"][1]
end


puts "----------------------------- Compile cproc -----------------------------------------------"


def compile_cproc_c(output)
  File.delete(output) rescue nil
  measure do
    cmd = "cproc #{INCLUDES_STR_CC} c/src/*.c c/main.c #{LINK_FLAGS} -o #{output}"
    run_cmd cmd
  end
end

CPROC_OPTS_C =   [
  {
    "name" => "cproc",
    "opts" => ["./target/c_cproc"],
  },
]

CPROC_OPTS_C.each do |h|
  puts "Compile cproc c #{h["name"]}"
  compile_h[h["name"]] = compile_cproc_c(*h["opts"])
  output_h[h["name"]] = h["opts"][0]
end

puts "----------------------------- Compile finished -----------------------------------------------"

p "-" * 100
p gen_h
p compile_h

puts "----------------------------- Run benchmark -----------------------------------------------"
run_h = {}

def run(binary)
  c = "#{binary} #{ROOT}/../run.js"
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
  puts "Run #{name} #{output}"
  run_h[name] = run(output)
end

p run_h

puts "----------------------------- Run finished -----------------------------------------------"

def markdown_table(build_times, run_times)
  output = []
  output << "| Compiler | Build time | Runtime |"
  output << "|:-------|-------------:|-----:|"

  build_times.each do |compiler, time|
    ms = (time * 1000).round
    run = "#{run_times[compiler].round(1)}s"
    output << "| #{compiler} | #{ms}ms | #{run} |"
  end

  output.join("\n")
end

puts
puts markdown_table(compile_h, run_h)
