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
cppgm: cppgm 0.10.3 (host configuration: g++)
myc-llvm: myc 0.12.3-6ae1303 LLVM 23.1.5 (https://github.com/kostya/myc)
myc-qbe: myc 0.12.3-6ae1303 QBE fab6d40 (https://github.com/kostya/myc)
myc-c: myc 0.12.3-6ae1303 C(clang version 23.1.5) (https://github.com/kostya/myc)
myc-gm: myc 0.12.3-6ae1303 GM v0.10.3 (https://github.com/kostya/myc)
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
| mycc | llvm |  | 1.2841 | 60.6917 |
| mycc | llvm | --final | 2.4648 | 52.7678 |
| mycc | c |  | 2.339 | 56.9229 |
| mycc | c | --final | 3.0701 | 52.1554 |
| mycc | gm |  | 0.7056 | 58.3647 |
| mycc | gm | --final | 0.8172 | 52.9674 |
| mycc | qbe |  | 0.6948 | 78.5655 |
| clang | llvm | -O0 | 0.3466 | 142.9005 |
| clang | llvm | -O1 | 1.662 | 54.1817 |
| clang | llvm | -O2 | 2.0348 | 51.293 |
| clang | llvm | -O3 | 2.084 | 51.548 |
| gcc | - | -O0 | 0.8089 | 133.0356 |
| gcc | - | -O1 | 1.8844 | 57.4204 |
| gcc | - | -O2 | 3.6546 | 52.2313 |
| gcc | - | -O3 | 4.7995 | 50.6496 |
| cproc | qbe |  | 0.2044 | 89.2181 |

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
| myc | llvm |  | 0.9457 | 60.5432 |
| myc | llvm | --final | 2.122 | 51.8063 |
| myc | c |  | 1.9999 | 56.9043 |
| myc | c | --final | 2.7125 | 52.7507 |
| myc | gm |  | 0.3644 | 58.3612 |
| myc | gm | --final | 0.4718 | 52.9375 |
| myc | qbe |  | 0.3517 | 77.6754 |
| clang | llvm | -O0 | 0.1989 | 139.7218 |
| clang | llvm | -O1 | 1.4512 | 54.3985 |
| clang | llvm | -O2 | 1.8116 | 52.1607 |
| clang | llvm | -O3 | 1.8923 | 51.5508 |

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
| llvm-ll | clang(-O3) | 1529 | 1173ms | 636ms |
| myc | myc-llvm(default) | 486 | 233ms | 683ms |
| myc | myc-llvm(final) | 486 | 1172ms | 622ms |
| qbe-ssa | qbe + clang(as+linker) | 345 | 82ms + 52ms | 808ms |
| myc | myc-qbe(default) | 486 | 464ms | 852ms |
| c | clang(-O3) | 128 | 1235ms | 623ms |
| myc | myc-c(default) | 486 | 1457ms | 632ms |
| myc | myc-c(final) | 486 | 1634ms | 627ms |
| lowir | cppgm(-O3) | 1157 | 151ms | 656ms |
| myc | myc-gm(default) | 486 | 136ms | 682ms |
| myc | myc-gm(final) | 486 | 178ms | 672ms |

# 4. Myc examples: (myc)

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 4.examples/
ruby run.rb
```

| Benchmark | Backend | Compile | Run |
|:----------|:-------:|--------:|----:|
| mandel.myc | myc-llvm | 239ms | 682ms |
| | myc-qbe | 506ms | 853ms |
| | myc-c | 1463ms | 636ms |
| | myc-gm | 142ms | 681ms |
| | myc-llvm-final | 1181ms | 621ms |
| | myc-qbe-final | 512ms | 852ms |
| | myc-c-final | 1648ms | 623ms |
| | myc-gm-final | 191ms | 673ms |
| bf.myc | myc-llvm | 54ms | 2432ms |
| | myc-qbe | 42ms | 2693ms |
| | myc-c | 79ms | 2601ms |
| | myc-gm | 39ms | 6069ms |
| | myc-llvm-final | 65ms | 2548ms |
| | myc-qbe-final | 41ms | 2694ms |
| | myc-c-final | 83ms | 2745ms |
| | myc-gm-final | 42ms | 1593ms |
| loop.myc | myc-llvm | 48ms | 201ms |
| | myc-qbe | 39ms | 2437ms |
| | myc-c | 62ms | 185ms |
| | myc-gm | 37ms | 327ms |
| | myc-llvm-final | 52ms | 192ms |
| | myc-qbe-final | 40ms | 2439ms |
| | myc-c-final | 65ms | 139ms |
| | myc-gm-final | 37ms | 317ms |
| loop.c | myc-llvm | 86ms | 200ms |
| | myc-qbe | 85ms | 2437ms |
| | myc-c | 106ms | 164ms |
| | myc-gm | 81ms | 323ms |
| | myc-llvm-final | 85ms | 216ms |
| | myc-qbe-final | 85ms | 199ms |
| | myc-c-final | 85ms | 200ms |
| | myc-gm-final | 85ms | 205ms |
| sieve.c | myc-llvm | 99ms | 290ms |
| | myc-qbe | 98ms | 289ms |
| | myc-c | 122ms | 287ms |
| | myc-gm | 94ms | 299ms |
| | myc-llvm-final | 99ms | 287ms |
| | myc-qbe-final | 98ms | 290ms |
| | myc-c-final | 98ms | 284ms |
| | myc-gm-final | 98ms | 287ms |

# 5. Myc-GM vs Clang in index-c. Detailed.

```
docker run --rm -it -w /src -v `pwd`:/src myc-benchmarks
cd 5.myc-gm-vs-clang/
ruby run.rb
```

compile mycc --backend gm --final in 0.817688208
compile clang -O3 in 2.106630775

| # | test | mycc --backend gm --final | clang -O3 | Δ (s) | slowdown (%) | status |
|---|---|---|---|---|---|---|
| 1 | Etc::GameOfLife | 1.401 | 1.063 | +0.338 | +31.8% | OK |
| 2 | Base64::Decode | 1.383 | 1.065 | +0.318 | +29.9% | OK |
| 3 | Etc::TextRaytracer | 1.268 | 0.977 | +0.291 | +29.8% | OK |
| 4 | Etc::NeuralNet | 1.223 | 0.999 | +0.224 | +22.4% | OK |
| 5 | Compress::BWTEncode | 1.269 | 1.047 | +0.222 | +21.2% | OK |
| 6 | Distance::Jaro | 1.080 | 0.951 | +0.129 | +13.6% | OK |
| 7 | Template::Parse | 1.155 | 1.024 | +0.131 | +12.8% | OK |
| 8 | Compress::LZWDecode | 1.180 | 1.055 | +0.125 | +11.8% | OK |
| 9 | Distance::NGram | 1.144 | 1.047 | +0.097 | +9.3% | OK |
| 10 | Maze::AStar | 1.149 | 1.053 | +0.096 | +9.1% | OK |
| 11 | Compress::LZWEncode | 1.293 | 1.190 | +0.103 | +8.7% | OK |
| 12 | Graph::BFS | 1.056 | 0.975 | +0.081 | +8.3% | OK |
| 13 | Maze::BFS | 1.111 | 1.030 | +0.081 | +7.9% | OK |
| 14 | Json::ParseMapping | 1.060 | 0.984 | +0.076 | +7.7% | OK |
| 15 | Json::ParseDom | 1.083 | 1.007 | +0.076 | +7.5% | OK |
| 16 | Sort::Quick | 1.081 | 1.008 | +0.073 | +7.2% | OK |
| 17 | CLBG::Spectralnorm | 1.073 | 1.015 | +0.058 | +5.7% | OK |
| 18 | Compress::HuffDecode | 0.521 | 0.493 | +0.028 | +5.7% | OK |
| 19 | Brainfuck::Array | 1.387 | 1.314 | +0.073 | +5.6% | OK |
| 20 | Sort::Merge | 0.816 | 0.781 | +0.035 | +4.5% | OK |
| 21 | Maze::Generator | 1.052 | 1.009 | +0.043 | +4.3% | OK |
| 22 | Compress::ArithEncode | 0.981 | 0.948 | +0.033 | +3.5% | OK |
| 23 | Graph::DFS | 1.012 | 0.978 | +0.034 | +3.5% | OK |
| 24 | Sort::Self | 1.112 | 1.080 | +0.032 | +3.0% | OK |
| 25 | Compress::ArithDecode | 0.986 | 0.963 | +0.023 | +2.4% | OK |
| 26 | Etc::CacheSimulation | 1.029 | 1.006 | +0.023 | +2.3% | OK |
| 27 | Calculator::Interpreter | 1.062 | 1.040 | +0.022 | +2.1% | OK |
| 28 | CLBG::Mandelbrot | 1.060 | 1.041 | +0.019 | +1.8% | OK |
| 29 | Etc::Words | 1.057 | 1.039 | +0.018 | +1.7% | OK |
| 30 | Calculator::Ast | 1.026 | 1.011 | +0.015 | +1.5% | OK |
| 31 | Graph::AStar | 0.838 | 0.831 | +0.007 | +0.8% | OK |
| 32 | Matmul::T16 | 0.987 | 0.981 | +0.006 | +0.6% | OK |
| 33 | Matmul::T4 | 1.055 | 1.050 | +0.005 | +0.5% | OK |
| 34 | Matmul::T8 | 0.996 | 0.995 | +0.001 | +0.1% | OK |
| 35 | Matmul::Single | 1.036 | 1.038 | -0.002 | -0.2% | OK |
| 36 | Compress::BWTDecode | 1.054 | 1.072 | -0.018 | -1.7% | OK |
| 37 | Etc::LogParser | 0.777 | 0.795 | -0.018 | -2.3% | OK |
| 38 | Base64::Encode | 1.002 | 1.038 | -0.036 | -3.5% | OK |
| 39 | CLBG::Nbody | 1.016 | 1.053 | -0.037 | -3.5% | OK |
| 40 | Hash::CRC32 | 0.216 | 0.225 | -0.009 | -4.0% | OK |
| 41 | Binarytrees::Arena | 1.653 | 1.726 | -0.073 | -4.2% | OK |
| 42 | CSV::Parse | 0.934 | 0.978 | -0.044 | -4.5% | OK |
| 43 | Template::Regex | 1.032 | 1.082 | -0.050 | -4.6% | OK |
| 44 | Json::Generate | 0.964 | 1.014 | -0.050 | -4.9% | OK |
| 45 | CLBG::Fannkuchredux | 1.028 | 1.089 | -0.061 | -5.6% | OK |
| 46 | Binarytrees::Obj | 1.016 | 1.082 | -0.066 | -6.1% | OK |
| 47 | Brainfuck::Recursion | 1.466 | 1.568 | -0.102 | -6.5% | OK |
| 48 | Compress::HuffEncode | 1.186 | 1.334 | -0.148 | -11.1% | OK |
| 49 | Etc::Sieve | 1.098 | 1.494 | -0.396 | -26.5% | OK |
| 50 | Hash::SHA256 | 0.329 | 1.016 | -0.687 | -67.6% | OK |

Summary: myc-gm=52.793s clang=51.654s diff=+1.139s (+2.2%)