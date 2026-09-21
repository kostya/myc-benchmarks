CMDS = [
  ["gcc(O0)", "gcc -O0 index.c -o "],
  ["gcc(O1)", "gcc -O1 index.c -o "],
  ["gcc(O2)", "gcc -O2 index.c -o "],
  ["gcc(O3)", "gcc -O3 index.c -o "],
  ["clang(O0)", "clang -O0 index.c -o "],
  ["clang(O1)", "clang -O1 index.c -o "],
  ["clang(O2)", "clang -O2 index.c -o "],
  ["clang(O3)", "clang -O3 index.c -o "],
  ["cproc", "cproc index.c -o "],
]

["--debug", "", "--final"].each do |mode|
  %w{llvm qbe c}.each do |backend|
    CMDS << ["mycc(#{backend}, #{mode == "" ? "default" : mode})", "mycc c --backend #{backend} #{mode} index.c "]
  end
end

def measure
  t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  yield
  (Process.clock_gettime(Process::CLOCK_MONOTONIC) - t).to_f
end

def run_cmd(cmd)
  puts cmd unless ENV["MYC_CI"] == "1"
  `#{cmd}`
end

def output_path(cmd)
  "/tmp/index_c_" + cmd.tr(" -", "__").downcase
end

def compile(cmd)
  output = output_path(cmd)
  File.delete(output) rescue nil
  delta = measure do
    cmd = "#{cmd} #{output}"
    run_cmd cmd
  end

  [output, delta]
end

outputs = {}
h = {}

CMDS.each do |(name, cmd)|
  output, delta = compile(cmd)
  outputs[name] = output
  h[name] = delta
end

p h

h2 = {}
outputs.each do |name, output|
  res = `#{output}`
  line = res.split("\n").find { |l| l.include?("Summary") }
  if line && line.include?("50, 50, ") && line =~ /Summary:\s*(\d+\.\d+)s/
    delta = $1.to_f
    puts "OK in #{delta}"
    h2[name] = delta
  else
    puts "ERROR #{line}"
  end
end

p h2