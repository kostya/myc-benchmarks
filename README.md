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

# 1. C compilers on index-c: (clang, gcc, mycc, cproc)

Running on [index-c](https://github.com/kostya/index-c) benchmark.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 1.index-c
ruby run.rb
```

| Compiler | Backend | Flags | Compile (s) | Run (s) |
|----------|---------|-------|-------------|---------|
| mycc | llvm |  | 1.3593 | 60.134 |
| mycc | llvm | --final | 2.5393 | 52.0551 |
| mycc | c |  | 2.8693 | 59.4511 |
| mycc | c | --final | 5.8343 | 52.0524 |
| mycc | gm |  | 0.8394 | 57.5891 |
| mycc | gm | --final | 0.9276 | 52.6172 |
| mycc | qbe |  | 0.7798 | 78.3651 |
| clang | llvm | -O0 | 0.3459 | 142.2597 |
| clang | llvm | -O1 | 1.6685 | 54.0844 |
| clang | llvm | -O2 | 2.0338 | 51.1672 |
| clang | llvm | -O3 | 2.0754 | 51.5966 |
| gcc | - | -O0 | 0.8085 | 132.7673 |
| gcc | - | -O1 | 1.8853 | 57.5418 |
| gcc | - | -O2 | 3.6455 | 52.3248 |
| gcc | - | -O3 | 4.7855 | 50.5958 |
| cproc | qbe |  | 0.2056 | 88.9484 |

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
| myc | llvm |  | 0.9413 | 60.4062 |
| myc | llvm | --final | 2.1499 | 52.3026 |
| myc | c |  | 2.4507 | 59.3027 |
| myc | c | --final | 5.417 | 52.3337 |
| myc | gm |  | 0.4055 | 57.3465 |
| myc | gm | --final | 0.4992 | 52.6121 |
| myc | qbe |  | 0.352 | 78.2827 |
| clang | llvm | -O0 | 0.1984 | 140.4707 |
| clang | llvm | -O1 | 1.464 | 54.4958 |
| clang | llvm | -O2 | 1.8194 | 52.3311 |
| clang | llvm | -O3 | 1.9003 | 51.9817 |

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
| llvm-ll | clang(-O3) | 1529 | 1177ms | 637ms |
| myc | myc-llvm(default) | 486 | 222ms | 684ms |
| myc | myc-llvm(final) | 486 | 1173ms | 623ms |
| qbe-ssa | qbe + clang(as+linker) | 345 | 82ms + 49ms | 808ms |
| myc | myc-qbe(default) | 486 | 502ms | 852ms |
| c | clang(-O3) | 128 | 1272ms | 625ms |
| myc | myc-c(default) | 486 | 974ms | 673ms |
| myc | myc-c(final) | 486 | 1370ms | 665ms |
| lowir | cppgm | 1157 | 152ms | 651ms |
| myc | myc-gm(default) | 486 | 159ms | 681ms |
| myc | myc-gm(final) | 486 | 206ms | 673ms |

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
| 1 | Etc::GameOfLife | 1.412 | 1.078 | +0.334 | +31.0% | OK |
| 2 | Compress::HuffDecode | 0.641 | 0.491 | +0.150 | +30.5% | OK |
| 3 | Etc::TextRaytracer | 1.265 | 0.977 | +0.288 | +29.5% | OK |
| 4 | Etc::NeuralNet | 1.224 | 0.996 | +0.228 | +22.9% | OK |
| 5 | Compress::BWTEncode | 1.289 | 1.061 | +0.228 | +21.5% | OK |
| 6 | Distance::NGram | 1.184 | 1.025 | +0.159 | +15.5% | OK |
| 7 | Template::Parse | 1.174 | 1.032 | +0.142 | +13.8% | OK |
| 8 | Distance::Jaro | 1.051 | 0.955 | +0.096 | +10.1% | OK |
| 9 | CLBG::Spectralnorm | 1.117 | 1.016 | +0.101 | +9.9% | OK |
| 10 | Maze::AStar | 1.159 | 1.058 | +0.101 | +9.5% | OK |
| 11 | Compress::LZWEncode | 1.293 | 1.188 | +0.105 | +8.8% | OK |
| 12 | Sort::Quick | 1.076 | 0.991 | +0.085 | +8.6% | OK |
| 13 | Maze::BFS | 1.119 | 1.036 | +0.083 | +8.0% | OK |
| 14 | Graph::BFS | 1.046 | 0.976 | +0.070 | +7.2% | OK |
| 15 | Json::ParseMapping | 1.048 | 0.984 | +0.064 | +6.5% | OK |
| 16 | Json::ParseDom | 1.069 | 1.008 | +0.061 | +6.1% | OK |
| 17 | Compress::LZWDecode | 1.124 | 1.061 | +0.063 | +5.9% | OK |
| 18 | Graph::DFS | 1.021 | 0.966 | +0.055 | +5.7% | OK |
| 19 | Sort::Merge | 0.818 | 0.781 | +0.037 | +4.7% | OK |
| 20 | Base64::Decode | 1.102 | 1.067 | +0.035 | +3.3% | OK |
| 21 | Sort::Self | 1.110 | 1.076 | +0.034 | +3.2% | OK |
| 22 | Brainfuck::Array | 1.355 | 1.315 | +0.040 | +3.0% | OK |
| 23 | Compress::ArithDecode | 0.995 | 0.969 | +0.026 | +2.7% | OK |
| 24 | Maze::Generator | 1.047 | 1.022 | +0.025 | +2.4% | OK |
| 25 | Calculator::Ast | 1.014 | 0.992 | +0.022 | +2.2% | OK |
| 26 | Compress::ArithEncode | 0.974 | 0.954 | +0.020 | +2.1% | OK |
| 27 | Calculator::Interpreter | 1.084 | 1.062 | +0.022 | +2.1% | OK |
| 28 | CLBG::Mandelbrot | 1.061 | 1.040 | +0.021 | +2.0% | OK |
| 29 | Etc::CacheSimulation | 1.019 | 1.002 | +0.017 | +1.7% | OK |
| 30 | Etc::Words | 1.048 | 1.036 | +0.012 | +1.2% | OK |
| 31 | Template::Regex | 1.104 | 1.093 | +0.011 | +1.0% | OK |
| 32 | Matmul::T4 | 1.056 | 1.053 | +0.003 | +0.3% | OK |
| 33 | Matmul::Single | 1.039 | 1.039 | +0.000 | +0.0% | OK |
| 34 | Graph::AStar | 0.830 | 0.831 | -0.001 | -0.1% | OK |
| 35 | Matmul::T8 | 0.996 | 0.998 | -0.002 | -0.2% | OK |
| 36 | Matmul::T16 | 0.989 | 0.998 | -0.009 | -0.9% | OK |
| 37 | Json::Generate | 0.963 | 0.982 | -0.019 | -1.9% | OK |
| 38 | Compress::BWTDecode | 1.038 | 1.068 | -0.030 | -2.8% | OK |
| 39 | Base64::Encode | 1.004 | 1.039 | -0.035 | -3.4% | OK |
| 40 | CLBG::Nbody | 1.015 | 1.052 | -0.037 | -3.5% | OK |
| 41 | Hash::CRC32 | 0.216 | 0.225 | -0.009 | -4.0% | OK |
| 42 | Etc::LogParser | 0.761 | 0.794 | -0.033 | -4.2% | OK |
| 43 | Compress::HuffEncode | 1.253 | 1.314 | -0.061 | -4.6% | OK |
| 44 | CSV::Parse | 0.939 | 0.993 | -0.054 | -5.4% | OK |
| 45 | CLBG::Fannkuchredux | 1.026 | 1.088 | -0.062 | -5.7% | OK |
| 46 | Brainfuck::Recursion | 1.452 | 1.568 | -0.116 | -7.4% | OK |
| 47 | Binarytrees::Obj | 0.993 | 1.099 | -0.106 | -9.6% | OK |
| 48 | Binarytrees::Arena | 1.647 | 1.898 | -0.251 | -13.2% | OK |
| 49 | Etc::Sieve | 1.098 | 1.494 | -0.396 | -26.5% | OK |
| 50 | Hash::SHA256 | 0.327 | 1.016 | -0.689 | -67.8% | OK |

Summary: myc-gm=52.685s clang=51.857s diff=+0.828s (+1.6%)