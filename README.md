# Set of Benchmarks for myc.

Add `myc-llvm`, `myc-qbe`, `myc-c`, `mycc` to Path.

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

## Benchmark1 LangArena single IR file

Run LangArena from single IR files: [myc](https://github.com/kostya/myc-benchmarks/blob/master/LangArena/langarena-single-myc/langarena.myc), [ll](https://github.com/kostya/myc-benchmarks/blob/master/LangArena/langarena-single-ll/langarena.ll). This will show pure engine optimization skills.

`Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)`, `myc 0.9.0-f237d9c, LLVM 20.1.2 (https://github.com/kostya/myc)`

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



