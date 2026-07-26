# Set of Benchmarks for [myc](https://github.com/kostya/myc).

Running on Ryzen 3800x and ubuntu 24.04. Add `myc-llvm`, `myc-qbe`, `myc-c`, `mycc` to Path.

```
git clone https://github.com/kostya/myc-benchmarks.git
cd myc-benchmarks
```

# LangArena

### Fetch and Build deps
```
cd LangArena/c; make MODE=prod target/deps/prod/yyjson.o target/deps/prod/libbase64.o; cd -
```

### Generate Myc ir files
```
cd LangArena; ruby gen_myc.rb; cd -
```

### Generate LLVM ir files
```
cd LangArena; ruby gen_ll.rb; cd -
```

## Benchmark1: LangArena single IR file

Comparing pure compiler backends without С parsing overhead. Both [myc IR](https://github.com/kostya/myc-benchmarks/blob/master/LangArena/langarena-single-myc/langarena.myc) and [LLVM IR](https://github.com/kostya/myc-benchmarks/blob/master/LangArena/langarena-single-ll/langarena.ll) represent the same program and both generated from the same C program (in ./c folder) in O0 mode without any processing. This benchmark shows raw optimization and code generation skills for both engines.

`Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)`, `myc 0.9.0-f237d9c, LLVM 20.1.2`

```
cd LangArena; ruby run_single_ir_benchmark.rb; cd -
```

| Compiler | Build time | Runtime |
|:-------|-------------:|-----:|
| clang(-O3, ll) | 1603ms | 52.1s |
| clang(-O2, ll) | 1572ms | 52.6s |
| clang(-O1, ll) | 1286ms | 55.4s |
| clang(-O0, ll) | 193ms | 139.0s |
| myc-llvm(default) | 889ms | 59.6s |
| myc-llvm(final) | 1880ms | 52.8s |
| myc-qbe(default) | 262ms | 68.3s |
| myc-c(default, clang) | 1589ms | 60.6s |
| myc-c(final, clang) | 3115ms | 53.3s |

1. myc-qbe(default) - compiles only 35% slower than Clang -O0 (262ms vs 193ms), and 6x faster than Clang -O3 (262ms vs 1603ms). Despite near-instant compilation, runtime is only 31% slower than Clang -O3 (68.3s vs 52.1s). myc-qbe delivers a tradeoff that even Go would envy.

2. myc-llvm(default) - 1.8x faster compilation than Clang -O3 (889ms vs 1603ms), with runtime only 14% slower (59.6s vs 52.1s). A solid balance: fast compiles, decent performance (golang philosophy).

3. myc-llvm(final) - runtime is nearly identical to Clang -O3 (52.8s vs 52.1s, just 1.3% slower), but compilation takes 17% longer (1880ms vs 1603ms). LLVM spends ~280ms more optimizing Myc-generated IR - needs investigation.

4. myc-c - adds overhead by generating C code and compiling it through the full Clang stack, so it can't compete with the other two backends on compile time. It's primarily a fallback backend for portability. Runtime is respectable: 60.6s default, 53.3s final - within 2% of Clang -O3 when using clang as the final compiler.


