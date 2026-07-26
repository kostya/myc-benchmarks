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
```
cd LangArena; ruby run_single_ir_benchmark.rb; cd -
```


