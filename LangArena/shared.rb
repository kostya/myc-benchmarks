require "fileutils"

SOURCES = Dir.glob("c/**/*.c")
SOURCES.reject! { |f| f.include?("c/deps/") || f.include?("c/target/") }
INCLUDES = ["./c", "./c/src", "./c/deps/yyjson/src", "./c/deps/base64/include", "/opt/homebrew/include"]

INCLUDES_STR_CC = INCLUDES.map{ |i| "-I#{i}" }.join(" ")
INCLUDES_STR_MYC = INCLUDES.join(",")
LINK_FLAGS = "-lpcre2-8 ./c/target/deps/prod/libbase64.o ./c/target/deps/prod/yyjson.o -L/opt/homebrew/lib -lm"

def measure
  t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  yield
  (Process.clock_gettime(Process::CLOCK_MONOTONIC) - t).to_f
end

$exitst = 0
at_exit { exit $exitst }

def run_cmd(cmd)
  puts cmd unless ENV["MYC_CI"] == "1"
  `#{cmd}`
end

FileUtils.mkdir_p("./binaries")

def touch_dir(dir)
  FileUtils.mkdir_p(dir)
end

def rm_dir(dir)
  FileUtils.rm_rf(dir)
end
