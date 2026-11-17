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
docker run --rm myc-benchmarks sh -c 'for t in clang gcc cproc qbe cppgm myc-llvm myc-qbe myc-c myc-gm; do printf "%s: " "$t"; command -v "$t" >/dev/null 2>&1 && { "$t" --version 2>&1 | head -n1 || "$t" -v 2>&1 | head -n1; } || echo "not found"; done'
```

```
clang: clang version 23.1.5
gcc: gcc (GCC) 16.2.1 20260810
cppgm: cppgm 0.9.6 (host configuration: g++)
myc-llvm: myc 0.12.1-c154ee5 LLVM 23.1.5 (https://github.com/kostya/myc)
myc-qbe: myc 0.12.1-c154ee5 QBE fab6d40 (https://github.com/kostya/myc)
myc-c: myc 0.12.1-c154ee5 C(cc (GCC) 16.2.1 20260810) (https://github.com/kostya/myc)
myc-gm: myc 0.12.1-c154ee5 GM v0.9.6 (https://github.com/kostya/myc)
```

# 1. C compilers on index-c: (clang, gcc, mycc, cproc)

Running on [index-c](https://github.com/kostya/index-c) benchmark.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 1.index-c
ruby run.rb
```

| Compiler | Backend | Flags | Compile (s) | Run (s) |
|----------|---------|-------|-------------|---------|
| mycc | llvm |  | 1.5451 | 60.1436 |
| mycc | llvm | --final | 2.5695 | 51.9172 |
| mycc | c |  | 2.9886 | 59.2757 |
| mycc | c | --final | 5.8647 | 52.2412 |
| mycc | gm |  | 0.8156 | 57.2475 |
| mycc | gm | --final | 0.8767 | 52.5471 |
| mycc | qbe |  | 0.8204 | 78.4971 |
| clang | llvm | -O0 | 0.4201 | 142.773 |
| clang | llvm | -O1 | 1.6904 | 54.1242 |
| clang | llvm | -O2 | 2.0602 | 51.0166 |
| clang | llvm | -O3 | 2.085 | 51.5749 |
| gcc | - | -O0 | 0.8041 | 132.5994 |
| gcc | - | -O1 | 1.9168 | 57.5374 |
| gcc | - | -O2 | 3.6483 | 52.2808 |
| gcc | - | -O3 | 4.8191 | 50.6065 |
| cproc | qbe |  | 0.2372 | 88.7688 |

![plot](plot1.png)

# 2. Pure IR files on index-c: (myc, clang)

Running on [index-c](https://github.com/kostya/index-c) benchmark. But index.c transformed into index-c.myc and index-c.ll. This benchmark show pure IR compilation capabilities without C frontend overhead.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 2.index-c.ir
ruby gen_ir.rb
ruby run.rb
```

| Compiler | Backend | Flags | Compile (s) | Run (s) |
|----------|---------|-------|-------------|---------|
| myc | llvm |  | 0.9388 | 60.3338 |
| myc | llvm | --final | 2.1202 | 51.9244 |
| myc | c |  | 2.4502 | 59.1295 |
| myc | c | --final | 5.4218 | 52.0605 |
| myc | gm |  | 0.3641 | 57.1806 |
| myc | gm | --final | 0.4604 | 52.4984 |
| myc | qbe |  | 0.3503 | 78.3457 |
| clang | llvm | -O0 | 0.3036 | 139.0683 |
| clang | llvm | -O1 | 1.4524 | 54.2433 |
| clang | llvm | -O2 | 1.8051 | 52.0981 |
| clang | llvm | -O3 | 1.8923 | 51.5936 |

![plot](plot2.png)

# 3. Brainfuck compiler: (llvm, qbe, myc, cppgm)

Compile mandelbrot brainfuck program by Erik Bosman using 4 pure backend and myc as 5 proxy backend.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 3.brainfuck-compiler/
ruby run.rb
```

| IR | Compiler | IR size, Kb | Compile time | Run time |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| llvm-ll | clang(-O3) | 1529 | 1170ms | 636ms |
| myc | myc-llvm(default) | 486 | 218ms | 682ms |
| myc | myc-llvm(final) | 486 | 1161ms | 623ms |
| qbe-ssa | qbe + clang(as+linker) | 345 | 79ms + 53ms | 808ms |
| myc | myc-qbe(default) | 486 | 496ms | 851ms |
| c | clang(-O3) | 128 | 1263ms | 625ms |
| myc | myc-c(default) | 486 | 965ms | 671ms |
| myc | myc-c(final) | 486 | 1362ms | 665ms |
| lowir | cppgm(-O3) | 1157 | 150ms | 649ms |
| myc | myc-gm(default) | 486 | 125ms | 682ms |
| myc | myc-gm(final) | 486 | 173ms | 673ms |

# 4. Myc examples: (myc)

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 4.examples/
ruby run.rb
```

| Benchmark | Backend | Compile | Run |
|:----------|:-------:|--------:|----:|
| mandel.myc | myc-llvm | 229ms | 684ms |
| | myc-qbe | 502ms | 852ms |
| | myc-c | 1099ms | 672ms |
| | myc-gm | 136ms | 682ms |
| | myc-llvm-final | 1170ms | 621ms |
| | myc-qbe-final | 503ms | 852ms |
| | myc-c-final | 1388ms | 665ms |
| | myc-gm-final | 180ms | 673ms |
| bf.myc | myc-llvm | 109ms | 2420ms |
| | myc-qbe | 31ms | 2696ms |
| | myc-c | 104ms | 1788ms |
| | myc-gm | 29ms | 6070ms |
| | myc-llvm-final | 55ms | 2626ms |
| | myc-qbe-final | 32ms | 2688ms |
| | myc-c-final | 176ms | 1113ms |
| | myc-gm-final | 32ms | 1596ms |
| loop.myc | myc-llvm | 76ms | 201ms |
| | myc-qbe | 29ms | 2440ms |
| | myc-c | 81ms | 159ms |
| | myc-gm | 26ms | 327ms |
| | myc-llvm-final | 42ms | 195ms |
| | myc-qbe-final | 29ms | 2437ms |
| | myc-c-final | 90ms | 117ms |
| | myc-gm-final | 27ms | 316ms |
| loop.c | myc-llvm | 76ms | 200ms |
| | myc-qbe | 76ms | 2437ms |
| | myc-c | 95ms | 145ms |
| | myc-gm | 72ms | 321ms |
| | myc-llvm-final | 75ms | 200ms |
| | myc-qbe-final | 76ms | 217ms |
| | myc-c-final | 77ms | 199ms |
| | myc-gm-final | 76ms | 199ms |
| sieve.c | myc-llvm | 128ms | 288ms |
| | myc-qbe | 88ms | 289ms |
| | myc-c | 112ms | 287ms |
| | myc-gm | 85ms | 295ms |
| | myc-llvm-final | 90ms | 283ms |
| | myc-qbe-final | 90ms | 285ms |
| | myc-c-final | 90ms | 285ms |
| | myc-gm-final | 90ms | 285ms |

# 5. Myc-GM vs Clang in index-c. Detailed.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 5.myc-gm-vs-clang/
ruby run.rb
```

| # | test | myc-gm --final | clang -O3 | Δ (s) | slowdown (%) | status |
|---|---|---|---|---|---|---|
| 1 | Etc::GameOfLife | 1.396 | 1.057 | +0.339 | +32.1% | OK |
| 2 | Etc::TextRaytracer | 1.263 | 0.976 | +0.287 | +29.4% | OK |
| 3 | Compress::HuffDecode | 0.634 | 0.491 | +0.143 | +29.1% | OK |
| 4 | Compress::BWTEncode | 1.275 | 1.037 | +0.238 | +23.0% | OK |
| 5 | Etc::NeuralNet | 1.222 | 0.996 | +0.226 | +22.7% | OK |
| 6 | Distance::NGram | 1.155 | 1.025 | +0.130 | +12.7% | OK |
| 7 | Template::Parse | 1.150 | 1.023 | +0.127 | +12.4% | OK |
| 8 | CLBG::Spectralnorm | 1.119 | 1.014 | +0.105 | +10.4% | OK |
| 9 | Maze::AStar | 1.145 | 1.043 | +0.102 | +9.8% | OK |
| 10 | Distance::Jaro | 1.044 | 0.953 | +0.091 | +9.5% | OK |
| 11 | Graph::BFS | 1.068 | 0.975 | +0.093 | +9.5% | OK |
| 12 | Compress::LZWEncode | 1.288 | 1.184 | +0.104 | +8.8% | OK |
| 13 | Sort::Quick | 1.073 | 0.989 | +0.084 | +8.5% | OK |
| 14 | Maze::BFS | 1.097 | 1.030 | +0.067 | +6.5% | OK |
| 15 | Compress::LZWDecode | 1.118 | 1.050 | +0.068 | +6.5% | OK |
| 16 | Graph::DFS | 1.017 | 0.962 | +0.055 | +5.7% | OK |
| 17 | Json::ParseMapping | 1.042 | 0.987 | +0.055 | +5.6% | OK |
| 18 | Json::ParseDom | 1.063 | 1.010 | +0.053 | +5.2% | OK |
| 19 | Sort::Merge | 0.816 | 0.780 | +0.036 | +4.6% | OK |
| 20 | Etc::CacheSimulation | 1.029 | 0.991 | +0.038 | +3.8% | OK |
| 21 | Maze::Generator | 1.047 | 1.010 | +0.037 | +3.7% | OK |
| 22 | Graph::AStar | 0.857 | 0.831 | +0.026 | +3.1% | OK |
| 23 | Base64::Decode | 1.098 | 1.065 | +0.033 | +3.1% | OK |
| 24 | Brainfuck::Array | 1.356 | 1.318 | +0.038 | +2.9% | OK |
| 25 | Sort::Self | 1.109 | 1.082 | +0.027 | +2.5% | OK |
| 26 | Matmul::T16 | 1.004 | 0.981 | +0.023 | +2.3% | OK |
| 27 | CLBG::Mandelbrot | 1.060 | 1.040 | +0.020 | +1.9% | OK |
| 28 | Calculator::Interpreter | 1.064 | 1.045 | +0.019 | +1.8% | OK |
| 29 | Calculator::Ast | 1.017 | 1.003 | +0.014 | +1.4% | OK |
| 30 | Etc::Words | 1.047 | 1.036 | +0.011 | +1.1% | OK |
| 31 | Compress::ArithEncode | 0.963 | 0.954 | +0.009 | +0.9% | OK |
| 32 | Compress::ArithDecode | 0.967 | 0.958 | +0.009 | +0.9% | OK |
| 33 | Template::Regex | 1.091 | 1.090 | +0.001 | +0.1% | OK |
| 34 | Matmul::Single | 1.039 | 1.039 | +0.000 | +0.0% | OK |
| 35 | Matmul::T8 | 0.994 | 0.994 | +0.000 | +0.0% | OK |
| 36 | CSV::Parse | 0.969 | 0.970 | -0.001 | -0.1% | OK |
| 37 | Matmul::T4 | 1.052 | 1.054 | -0.002 | -0.2% | OK |
| 38 | Compress::BWTDecode | 1.044 | 1.068 | -0.024 | -2.2% | OK |
| 39 | Json::Generate | 0.948 | 0.976 | -0.028 | -2.9% | OK |
| 40 | CLBG::Nbody | 1.015 | 1.051 | -0.036 | -3.4% | OK |
| 41 | Base64::Encode | 1.002 | 1.038 | -0.036 | -3.5% | OK |
| 42 | Hash::CRC32 | 0.216 | 0.225 | -0.009 | -4.0% | OK |
| 43 | Compress::HuffEncode | 1.267 | 1.338 | -0.071 | -5.3% | OK |
| 44 | CLBG::Fannkuchredux | 1.028 | 1.088 | -0.060 | -5.5% | OK |
| 45 | Binarytrees::Arena | 1.597 | 1.707 | -0.110 | -6.4% | OK |
| 46 | Brainfuck::Recursion | 1.467 | 1.569 | -0.102 | -6.5% | OK |
| 47 | Etc::LogParser | 0.760 | 0.814 | -0.054 | -6.6% | OK |
| 48 | Binarytrees::Obj | 0.988 | 1.075 | -0.087 | -8.1% | OK |
| 49 | Etc::Sieve | 1.090 | 1.484 | -0.394 | -26.5% | OK |
| 50 | Hash::SHA256 | 0.331 | 1.014 | -0.683 | -67.4% | OK |

Summary: myc-gm=52.501s clang=51.490s diff=+1.011s (+2.0%)
