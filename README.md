# Metacompilers

A project to explore developing [metacompilers](https://en.wikipedia.org/wiki/Compiler-compiler) based on the excellent
[Tutorial: Metacompilers Part 1](http://www.bayfronttechnologies.com/mc_tutorial.html).


## Getting Started

The `Metacompiler.swift` is generated using the `Resources/i01-initial-swift-compiler.metalang`.

The compiler can generate itself from the metalang file by doing the following:

```
swift build
```

Run the built `Runner` executable with the metalang file:

For instance on macOS:

```
.build/x86_64-apple-macosx10.10/debug/Runner Resources/i01-initial-swift-compiler.metalang > GeneratedCompiler.swift
```

The contents of `GeneratedCompiler.swift` should be the same as `Sources/Metacompilers/Metacompiler.swift`

## Swift Package Manager

This package is intended for use with [Swift Package Manager](https://swift.org/package-manager/). To use in your
own package, add the following dependency:

```
dependencies: [
  .package(url: "https://github.com/bluk/metacompilers.git", from: "0.1.0")
]
```

## Related Links

* [Tutorial: Metacompilers Part 1](http://www.bayfronttechnologies.com/mc_tutorial.html)

## License

[Apache-2.0](LICENSE)
