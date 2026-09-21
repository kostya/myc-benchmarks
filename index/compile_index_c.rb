CMDS = [
  ["gcc(O0)", "gcc -Wno-format -O0 index.c -lm -o "],
  ["gcc(O1)", "gcc -Wno-format -O1 index.c -lm -o "],
  ["gcc(O2)", "gcc -Wno-format -O2 index.c -lm -o "],
  ["gcc(O3)", "gcc -Wno-format -O3 index.c -lm -o "],
  ["clang(O0)", "clang -Wno-format -O0 index.c -lm -o "],
  ["clang(O1)", "clang -Wno-format -O1 index.c -lm -o "],
  ["clang(O2)", "clang -Wno-format -O2 index.c -lm -o "],
  ["clang(O3)", "clang -Wno-format -O3 index.c -lm -o "],
  ["cproc", "cproc index.c -lm -o "],
]

["--debug", "", "--final"].each do |mode|
  %w{llvm qbe c}.each do |backend|
    CMDS << ["mycc(#{backend}, #{mode == "" ? "default" : mode.sub("--", "")})", "mycc c --backend #{backend} #{mode} index.c "]
  end
end

def measure
  t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  yield
  (Process.clock_gettime(Process::CLOCK_MONOTONIC) - t).to_f
end

def run_cmd(cmd)
  print cmd unless ENV["MYC_CI"] == "1"
  `#{cmd}`
end

def output_path(cmd)
  "/tmp/index_c_" + cmd.tr(" -.", "___").downcase
end

def compile(cmd)
  output = output_path(cmd)
  File.delete(output) rescue nil
  delta = measure do
    cmd = "#{cmd} #{output}"
    run_cmd cmd
  end
  puts " in #{delta.round(3)}s"

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
  print "Run #{name} "
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