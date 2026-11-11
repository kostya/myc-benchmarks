require "fileutils"

def measure
  t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  yield
  (Process.clock_gettime(Process::CLOCK_MONOTONIC) - t).to_f
end

def parse_summary(st)
  m = st.match(/Summary:\s*([\d.]+)s/)
  m ? m[1].to_f : nil
end

def run_and_check(binary)
  st = `#{binary} 2>&1`
  ok = st.include?("50, 50, 0")
  rt = parse_summary(st)
  print(ok ? " OK " : " ERR ")
  [rt, ok]
end

def myc_run(backend, flag)
  printf "Run mycc #{backend} #{flag} ... "
  binary = "./bin_mycc_index_#{backend}_#{flag.gsub(/[^a-zA-Z0-9]/, '_')}"
  cmd = "myc-#{backend} index-c.myc c #{flag} #{binary}"
  `rm -f #{binary}`
  compile_time = measure { `#{cmd}` }
  run_time, ok = run_and_check(binary)
  res = [compile_time, run_time, ok ? "OK" : "ERR"]
  p res
  res
end

def c_run(compiler, flags)
  printf "Run #{compiler} #{flags} ... "
  binary = "./bin_c_index_#{compiler}_#{flags.gsub(/[^a-zA-Z0-9]/, '_')}"
  cmd = "#{compiler} index-c.ll #{flags} -lm -lpthread -o #{binary}"
  `rm -f #{binary}`
  compile_time = measure { `#{cmd}` }
  run_time, ok = run_and_check(binary)
  res = [compile_time, run_time, ok ? "OK" : "ERR"]
  p res
  res
end

ALL_FLAGS = []
%w{llvm c gm qbe}.each do |backend|
  flags = ["", "--final"]
  flags = [""] if backend == "qbe"
  flags.each do |flag|
    ALL_FLAGS << ["myc", backend, flag]
  end
end

%w{clang}.each do |compiler|
  backend = compiler == "clang" ? "llvm" : "-"
  %w{-O0 -O1 -O2 -O3}.each do |flag|
    ALL_FLAGS << [compiler, backend, flag]
  end
end

RES = []

ALL_FLAGS.each do |(compiler, backend, flag)|
  if compiler == "myc"
    RES << [compiler, backend, flag, *myc_run(backend, flag)]
  else
    RES << [compiler, backend, flag, *c_run(compiler, flag)]
  end
end

puts
puts "| Compiler | Backend | Flags | Compile (s) | Run (s) |"
puts "|----------|---------|-------|-------------|---------|"
RES.each do |compiler, backend, flags, compile_time, run_time, status|
  ct = compile_time ? compile_time.round(4) : ""
  rt = run_time ? run_time.round(4) : ""
  puts "| #{compiler} | #{backend} | #{flags} | #{ct} | #{rt} |"
end
