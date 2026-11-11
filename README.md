# Set of Benchmarks for [myc](https://github.com/kostya/myc).

Environment:

- **CPU:** Ryzen 3800X
- **RAM:** 78 GB DDR4-3200
- **OS:** Linux arch 7.2.7
- **Docker:** 29.8.1

Prepare environment:
```
docker build -t myc-benchmarks .
```

Show versions:
```
docker run --rm myc-benchmarks sh -c 'for t in clang gcc cproc qbe cppgm++ myc-llvm myc-qbe myc-c myc-gm; do printf "%s: " "$t"; command -v "$t" >/dev/null 2>&1 && { "$t" --version 2>&1 | head -n1 || "$t" -v 2>&1 | head -n1; } || echo "not found"; done'
```

# 1. C compilers on index-c: (clang, gcc, mycc, cproc)

Running on [index-c](https://github.com/kostya/index-c) benchmark.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 1.index-c
ruby run.rb
```

| Compiler | Backend | Flags | Compile (s) | Run (s) |
|----------|---------|-------|-------------|---------|--------|
| mycc | llvm |  | 1.3861 | 60.1767 |
| mycc | llvm | --final | 2.5244 | 51.9228 |
| mycc | c |  | 2.8505 | 59.7757 |
| mycc | c | --final | 5.8163 | 52.1159 |
| mycc | gm |  | 0.768 | 61.326 |
| mycc | gm | --final | 0.8727 | 53.3361 |
| mycc | qbe |  | 0.7656 | 78.2328 |
| clang | llvm | -O0 | 0.3439 | 142.5666 |
| clang | llvm | -O1 | 1.6629 | 53.9996 |
| clang | llvm | -O2 | 2.0166 | 51.156 |
| clang | llvm | -O3 | 2.0844 | 51.0058 |
| gcc | - | -O0 | 0.8005 | 132.4786 |
| gcc | - | -O1 | 1.8718 | 57.3093 |
| gcc | - | -O2 | 3.6296 | 52.2206 |
| gcc | - | -O3 | 4.7703 | 50.6755 |
| cproc | qbe |  | 0.2044 | 88.8468 |

# 2. Pure IR files on index-c: (myc, clang)

Running on [index-c](https://github.com/kostya/index-c) benchmark. But index.c transformed into index-c.myc and index-c.ll. This benchmark show pure IR compilation capabilities without C frontend overhead.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 2.index-c.ir
ruby gen_ir.rb
ruby run.rb
```

| Compiler | Backend | Flags | Compile (s) | Run (s) |
|----------|---------|-------|-------------|---------|--------|
| myc | llvm |  | 0.932 | 60.0968 |
| myc | llvm | --final | 2.1277 | 52.0302 |
| myc | c |  | 2.4351 | 59.0626 |
| myc | c | --final | 5.3817 | 51.8694 |
| myc | gm |  | 0.3415 | 61.5946 |
| myc | gm | --final | 0.4541 | 53.4905 |
| myc | qbe |  | 0.3453 | 78.1928 |
| clang | llvm | -O0 | 0.197 | 139.2588 |
| clang | llvm | -O1 | 1.4534 | 54.5575 |
| clang | llvm | -O2 | 1.8094 | 52.109 |
| clang | llvm | -O3 | 1.8932 | 51.3404 |

# 3. Brainfuck compiler: (llvm, qbe, myc, cppgm)

Compile mandelbrot brainfuck program by Erik Bosman using 4 pure backend and myc as 5 proxy backend.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 3.brainfuck-compiler/
ruby run.rb
```

| IR | Compiler | IR size, Kb | Compile time | Run time |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| llvm-ll | clang(-O3) | 1529 | 1160ms | 636ms |
| myc | myc-llvm(default) | 486 | 216ms | 683ms |
| myc | myc-llvm(final) | 486 | 1159ms | 621ms |
| qbe-ssa | qbe + clang(as+linker) | 345 | 78ms + 49ms | 811ms |
| myc | myc-qbe(default) | 486 | 497ms | 851ms |
| c | clang(-O3) | 128 | 1224ms | 626ms |
| myc | myc-c(default) | 486 | 961ms | 673ms |
| myc | myc-c(final) | 486 | 1352ms | 667ms |
| lowir | cppgm++ | 1157 | 106ms | 691ms |
| myc | myc-gm(default) | 486 | 126ms | 692ms |
| myc | myc-gm(final) | 486 | 170ms | 664ms |

# 4. Myc examples: (myc)

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 4.examples/
ruby run.rb
```

| Benchmark | Backend | Compile | Run |
|:----------|:-------:|--------:|----:|
| mandel.myc | myc-llvm | 228ms | 682ms |
| | myc-qbe | 541ms | 852ms |
| | myc-c | 988ms | 671ms |
| | myc-gm | 132ms | 692ms |
| | myc-llvm-final | 1166ms | 623ms |
| | myc-qbe-final | 504ms | 852ms |
| | myc-c-final | 1362ms | 666ms |
| | myc-gm-final | 177ms | 657ms |
| bf.myc | myc-llvm | 43ms | 2428ms |
| | myc-qbe | 31ms | 2690ms |
| | myc-c | 103ms | 1791ms |
| | myc-gm | 30ms | 6051ms |
| | myc-llvm-final | 54ms | 2547ms |
| | myc-qbe-final | 31ms | 2690ms |
| | myc-c-final | 204ms | 1109ms |
| | myc-gm-final | 31ms | 1684ms |
| loop.myc | myc-llvm | 37ms | 200ms |
| | myc-qbe | 28ms | 2437ms |
| | myc-c | 48ms | 169ms |
| | myc-gm | 27ms | 331ms |
| | myc-llvm-final | 39ms | 191ms |
| | myc-qbe-final | 29ms | 2439ms |
| | myc-c-final | 56ms | 116ms |
| | myc-gm-final | 27ms | 324ms |
| loop.c | myc-llvm | 74ms | 199ms |
| | myc-qbe | 73ms | 2437ms |
| | myc-c | 123ms | 183ms |
| | myc-gm | 71ms | 330ms |
| | myc-llvm-final | 74ms | 219ms |
| | myc-qbe-final | 73ms | 202ms |
| | myc-c-final | 73ms | 203ms |
| | myc-gm-final | 73ms | 200ms |
| sieve.c | myc-llvm | 87ms | 286ms |
| | myc-qbe | 86ms | 291ms |
| | myc-c | 108ms | 280ms |
| | myc-gm | 85ms | 290ms |
| | myc-llvm-final | 86ms | 285ms |
| | myc-qbe-final | 86ms | 287ms |
| | myc-c-final | 86ms | 282ms |
| | myc-gm-final | 87ms | 286ms |

# 5. Myc-GM vs Clang in index-c. Detailed.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 5.myc-gm-vs-clang/
ruby run.rb
```

| # | test | myc-gm --final | clang -O3 | Δ (s) | slowdown (%) | status |
|---|---|---|---|---|---|---|
| 1 | Etc::GameOfLife | 1.535 | 1.065 | +0.470 | +44.1% | OK |
| 2 | Etc::NeuralNet | 1.324 | 0.998 | +0.326 | +32.7% | OK |
| 3 | Etc::TextRaytracer | 1.259 | 0.976 | +0.283 | +29.0% | OK |
| 4 | Graph::AStar | 1.075 | 0.844 | +0.231 | +27.4% | OK |
| 5 | Etc::LogParser | 0.808 | 0.653 | +0.155 | +23.7% | OK |
| 6 | Compress::BWTEncode | 1.301 | 1.060 | +0.241 | +22.7% | OK |
| 7 | Distance::Jaro | 1.093 | 0.948 | +0.145 | +15.3% | OK |
| 8 | Compress::HuffDecode | 0.561 | 0.491 | +0.070 | +14.3% | OK |
| 9 | Distance::NGram | 1.141 | 1.008 | +0.133 | +13.2% | OK |
| 10 | Maze::AStar | 1.178 | 1.048 | +0.130 | +12.4% | OK |
| 11 | Maze::BFS | 1.156 | 1.031 | +0.125 | +12.1% | OK |
| 12 | Json::ParseDom | 1.112 | 0.997 | +0.115 | +11.5% | OK |
| 13 | Json::ParseMapping | 1.085 | 0.975 | +0.110 | +11.3% | OK |
| 14 | Base64::Decode | 1.171 | 1.064 | +0.107 | +10.1% | OK |
| 15 | Hash::SHA256 | 1.115 | 1.015 | +0.100 | +9.9% | OK |
| 16 | Calculator::Ast | 1.113 | 1.016 | +0.097 | +9.5% | OK |
| 17 | Compress::LZWDecode | 1.139 | 1.050 | +0.089 | +8.5% | OK |
| 18 | Sort::Merge | 0.848 | 0.789 | +0.059 | +7.5% | OK |
| 19 | Template::Parse | 1.151 | 1.071 | +0.080 | +7.5% | OK |
| 20 | Maze::Generator | 1.088 | 1.013 | +0.075 | +7.4% | OK |
| 21 | Base64::Encode | 1.114 | 1.038 | +0.076 | +7.3% | OK |
| 22 | Sort::Quick | 1.111 | 1.037 | +0.074 | +7.1% | OK |
| 23 | Compress::BWTDecode | 1.144 | 1.068 | +0.076 | +7.1% | OK |
| 24 | Compress::LZWEncode | 1.249 | 1.179 | +0.070 | +5.9% | OK |
| 25 | CLBG::Spectralnorm | 1.062 | 1.015 | +0.047 | +4.6% | OK |
| 26 | Json::Generate | 1.019 | 0.978 | +0.041 | +4.2% | OK |
| 27 | Compress::ArithEncode | 0.990 | 0.952 | +0.038 | +4.0% | OK |
| 28 | Sort::Self | 1.118 | 1.078 | +0.040 | +3.7% | OK |
| 29 | Calculator::Interpreter | 1.113 | 1.074 | +0.039 | +3.6% | OK |
| 30 | CLBG::Mandelbrot | 1.071 | 1.041 | +0.030 | +2.9% | OK |
| 31 | Graph::DFS | 0.999 | 0.973 | +0.026 | +2.7% | OK |
| 32 | Graph::BFS | 0.997 | 0.973 | +0.024 | +2.5% | OK |
| 33 | Etc::Words | 1.050 | 1.038 | +0.012 | +1.2% | OK |
| 34 | CSV::Parse | 0.984 | 0.978 | +0.006 | +0.6% | OK |
| 35 | Matmul::T8 | 0.995 | 0.992 | +0.003 | +0.3% | OK |
| 36 | Matmul::Single | 1.039 | 1.038 | +0.001 | +0.1% | OK |
| 37 | Matmul::T4 | 1.049 | 1.052 | -0.003 | -0.3% | OK |
| 38 | Compress::ArithDecode | 0.955 | 0.962 | -0.007 | -0.7% | OK |
| 39 | Matmul::T16 | 0.977 | 0.990 | -0.013 | -1.3% | OK |
| 40 | Compress::HuffEncode | 1.077 | 1.098 | -0.021 | -1.9% | OK |
| 41 | Hash::CRC32 | 0.216 | 0.224 | -0.008 | -3.6% | OK |
| 42 | CLBG::Nbody | 1.015 | 1.053 | -0.038 | -3.6% | OK |
| 43 | CLBG::Fannkuchredux | 1.053 | 1.094 | -0.041 | -3.7% | OK |
| 44 | Etc::CacheSimulation | 0.955 | 0.993 | -0.038 | -3.8% | OK |
| 45 | Binarytrees::Obj | 1.040 | 1.091 | -0.051 | -4.7% | OK |
| 46 | Brainfuck::Recursion | 1.300 | 1.381 | -0.081 | -5.9% | OK |
| 47 | Template::Regex | 1.003 | 1.076 | -0.073 | -6.8% | OK |
| 48 | Binarytrees::Arena | 1.514 | 1.763 | -0.249 | -14.1% | OK |
| 49 | Brainfuck::Array | 1.086 | 1.313 | -0.227 | -17.3% | OK |
| 50 | Etc::Sieve | 1.020 | 1.484 | -0.464 | -31.3% | OK |

Summary: myc-gm=53.568s clang=51.138s diff=+2.430s (+4.8%)
