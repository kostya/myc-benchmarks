CMDS = [
  "gcc -O0 index.c -o ",
  "gcc -O1 index.c -o ",
  "gcc -O2 index.c -o ",
  "gcc -O3 index.c -o ",
  "clang -O0 index.c -o ",
  "clang -O1 index.c -o ",
  "clang -O2 index.c -o ",
  "clang -O3 index.c -o ",
  "cproc index.c -o ",
]

["--debug", "", "--final"].each do |mode|
  %w{llvm qbe c}.each do |backend|
    CMDS << "mycc c --backend #{backend} #{mode} ",
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

outputs = []
h = {}

CMDS.each do |cmd|
  output, delta = compile(cmd)
  outputs << output
  h[cmd] = delta
end

p h

