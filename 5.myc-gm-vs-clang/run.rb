unless File.directory?("index-c")
  `git clone https://github.com/kostya/index-c.git`
end

def measure
  t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  yield
  (Process.clock_gettime(Process::CLOCK_MONOTONIC) - t).to_f
end

cmd = "mycc index-c/index.c c --final --backend gm ./bin_gm"
t = Time.now
`#{cmd}`
puts "compile myc-gm in #{Time.now - t}"

cmd = "clang -O3 index-c/index.c -lm -o ./bin_clang"
t = Time.now
`#{cmd}`
puts "compile clang in #{Time.now - t}"

def run_and_parse(bin)
  out = `#{bin}`
  results = {}
  out.each_line do |line|
    if line =~ /^(\S+::\S+):\s+(\w+)\s+in\s+([\d.]+)s/
      results[$1] = { status: $2, time: $3.to_f }
    end
  end
  results
end

puts "Running bin_gm..."
gm = run_and_parse("./bin_gm")
puts "Running bin_clang..."
clang = run_and_parse("./bin_clang")

all_tests = gm.keys + (clang.keys - gm.keys)

rows = all_tests.map do |name|
  g = gm[name]
  c = clang[name]
  gt = g ? g[:time] : nil
  ct = c ? c[:time] : nil
  status = [g && g[:status], c && c[:status]].compact.uniq.join("/")
  delta = (gt && ct) ? gt - ct : nil
  slowdown = (delta && ct && ct != 0) ? (delta / ct * 100.0) : nil
  { name: name, gm: gt, clang: ct, status: status, delta: delta, slowdown: slowdown }
end

rows.sort_by! { |r| r[:slowdown] ? -r[:slowdown] : Float::INFINITY }

puts
puts "| # | test | myc-gm --final | clang -O3 | Δ (s) | slowdown (%) | status |"
puts "|---|---|---|---|---|---|---|"
rows.each_with_index do |r, i|
  gm_s   = r[:gm]  ? format("%.3f", r[:gm])  : "-"
  cl_s   = r[:clang] ? format("%.3f", r[:clang]) : "-"
  d_s    = r[:delta] ? format("%+.3f", r[:delta]) : "-"
  sl_s   = r[:slowdown] ? format("%+.1f%%", r[:slowdown]) : "-"
  puts "| #{i + 1} | #{r[:name]} | #{gm_s} | #{cl_s} | #{d_s} | #{sl_s} | #{r[:status]} |"
end

total_gm    = gm.values.sum { |v| v[:time] }
total_clang = clang.values.sum { |v| v[:time] }
puts
puts "Summary: myc-gm=#{format('%.3f', total_gm)}s clang=#{format('%.3f', total_clang)}s " \
     "diff=#{format('%+.3f', total_gm - total_clang)}s " \
     "(#{format('%+.1f', (total_gm - total_clang) / total_clang * 100)}%)"
