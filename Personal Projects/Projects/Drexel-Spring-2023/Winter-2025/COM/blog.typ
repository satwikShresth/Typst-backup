#import "/template.typ": project
#show: project.with(
  title: "Com 310 - Project #1",
  author: "Satwik Shresth",
  date: "January 26, 2025",
)

#set enum(body-indent: 1em,indent: 1em,spacing: .8em)
#set text(size: 10pt)
#v(3pt)

= Modern Compiler Infrastructure

In the current digital landscape, compilers play a important role in bridging the gap between human readable code and the machine instructions that computers rely on. Before compilers, programmers used punch cards to interact with computers.


#v(4pt)
#figure(
  caption: [Punch card],
)[
#image("download.jpeg",width:55%)
  #v(-9pt)
  #h(155pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://www.ibm.com/history/punched-card")[
        #underline[
          "The IBM punched card"
        ]
      ]
    ]
  )
]



Compilers serve three critical functions:

+ They ensure code correctness by detecting syntax errors and type mismatches
+ They optimize code for better performance by eliminating redundant operations
+ They enable programming language port across different hardware architectures

In this document we will focus on hardware architecture portability. Computer processors come in many architectures, each with its own instruction set and method of execution. These processors require different machine code to perform the same task. Modern compilers handle this complexity by transforming our high level code into the specific instructions each processor needs.

== Evolution of Compilers

Traditional compilers were first built as single, massive programs that handled everything from reading source code to generating machine code. Each phase was tightly coupled, making compiler modifications complex and error prone.


In 2000, Chris Lattner recognized this issue and began developing LLVM (Low Level Virtual Machine). His vision was to modularize compiler design around a common core, the Low Level Intermediate Representation (LLIR). The LLIR is a language agnostic, low level code format that provides a consistent foundation for LLVM's various compiler tools and optimizations. By using a single, standardized representation, each stage of the compilation process can be cleaner, more independent, and simpler to maintain, ultimately making the entire compiler infrastructure more flexible and powerful.

=== The Three-Phase Architecture

This new architecture separated compilation into three distinct phases:

+ Frontend translates source code to IR
+ Middle layer performs optimizations on IR
+ Backend generates machine code for target processors

#v(4pt)
#figure(
  caption: [Three phases of compiler],
)[
#image("ThreePhaseCompiler.png",width: 45%)
  #v(-9pt)
  #h(70pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://siboehm.com/articles/21/lleaves")[
        #underline[
          "lleaves - Compiling Decision Trees"
        ]
      ]
    ]
  )
]
By decoupling the compilation pipeline into a well-defined IR, LLVM made it far easier for chip manufacturers to add support for new processors. Rather than building entire toolchains from scratch, vendors could focus on creating a backend to handle their custom instructions, relying on LLVM's existing ecosystem for the rest. This dramatically cut both cost and time, allowing startups to compete with established giants.

#box(width: 100%)[
  #set text(style: "italic")
  One prominent example of LLVM's influence is Sony, which uses an LLVM based compiler for development of its gaming consoles.
]

== The AI Revolution and GPU Computing

The rise of artificial intelligence introduced new challenges. While LLVM revolutionized traditional CPU based compilation, AI model's computation fundamentally differ from average tasks because they rely heavily on matrix operations and parallel processing.

Unlike CPUs, which excel at sequential tasks with intricate control flows, GPUs contain thousands of smaller cores that can execute the same operation in parallel across large datasets. Originally designed for rendering graphics, this architecture turned out to be perfect for modern AI models.
#v(-11pt)
#figure(
  caption: [CPU vs GPU],
)[
#image("Capture-2025-01-27-213205.png",width: 64%)
  #v(-21pt)
  #h(65pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://community.fs.com/article/deep-comparison-between-server-cpu-and-gpu.html")[
        #underline[
          "Deep Comparison Between Server CPU and GPU"
        ]
      ]
    ]
  )
]
The growing demand for AI turned out to be a golden opportunity for NVIDIA. Originally embraced by the gaming industry for graphics intensive applications, CUDA (Compute Unified Device Architecture) already had a massive user base and a proven performance record. 

While many competitors offer general purpose GPU solutions, NVIDIA’s CUDA ecosystem outperforms open alternatives. Their closed ecosystem grants them tighter control over optimizations, security patches, and feature rollouts, giving its hardware a competitive edge that is tough to match.


== Advent of MLIR

MLIR (Multi-Level Intermediate Representation) is a relatively new framework that builds on top of LLVM’s powerful compiler infrastructure. Unlike the classic IR, which operates primarily at a low level of abstraction, MLIR allows for multiple layers of representation within the same framework. 
#v(4pt)
#figure(
  caption: [MLIR workflow],
)[
#image("Capture-2025-01-27-202004.png")
  #v(-17pt)
  #h(400pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://www.researchgate.net/figure/Simple-visual-description-of-the-MLIR-compiler-flow-top-llvm-dialect-only-bottom_fig3_358422844")[
        #underline[
          researchgate.com
        ]
      ]
    ]
  )
]
This means you can capture high-level operations like matrix multiplications before converting them into low level representations. As a result, MLIR fits neatly into the broader LLVM ecosystem by seamlessly bridging the gap between high level languages and the final machine code optimizations.

One of MLIR’s most exciting design features is Dialect, which lets you define custom operations, types, and rules within the broader MLIR framework. Think of it as a self contained language that plugs into MLIR to represent different domains without having to reinvent an entire compiler toolchain.

This modularity allows developers to tap into a universal compilation framework that targets everything from CPUs to specialized AI chips. As a result, no single vendor dictates the software pipeline, making it easier for niche hardware solutions to break into the market.


== Mojo: Python's Superset
#v(.7em)
MLIR is a powerful compiler framework, yet its complexity often forces companies to stick to their established tech stack. With countless standards and billions of lines of legacy code, switching to new compiler is a near impossible task.

Enter Mojo, another brainchild of Chris Lattner. Mojo offers a Pythonic syntax that’s comfortable for data scientists and developers, while also supporting more explicit types for those who need performance of a compiled language. 

Mojo aims to become a superset of Python, letting teams write straightforward code that taps into MLIR’s advanced optimization capabilities.

== Zero-Cost Abstractions in Action
#v(.7em)

#let code_block(code, lang) = {
  block(
    fill: rgb("#f6f8fa"),
    inset: 8pt,
    radius: 4pt,
    text(
      font: "Fira Code",
      size: 10pt,
      raw(code, lang: lang)
    )
  )
}


#grid(
  columns: (1fr, 1fr),
  gutter: 21pt,
  [
    *Mojo (Typed)*
    #code_block("fn mandelbrot(c: ComplexFloat64) -> Int:
    var z = c
    var nv = 0
    for i in range(1, MAX_ITERS):
        if z.squared_norm() > 4:
            break
        z = z.squared_add(c)
        nv += 1
    return nv", "python")
  ],
  [
    *Python (Untyped)*
    #code_block("def mandelbrot(c):
    z = c
    nv = 0
    for i in range(1, MAX_ITERS):
      if abs(z) > 2:
        break
      z = z*z + c
      nv += 1
    return nv", "python")
  ]
)
#align(center)[
  #table(
    columns: (auto, auto),
    inset: 8pt,
    stroke: 0.5pt,
    align: left,
    [*Category*], [*Comparison*],
    [Function Declaration], [Mojo uses static typing with `ComplexFloat64` and `Int` return type],
    [Break Condition], [Mojo uses `squared_norm() > 4` vs Python's `abs(z) > 2`],
    [Complex Operations], [Mojo uses optimized `squared_add` method vs Python's direct multiplication],
  )
]

Both the above code snippets implement a function ` mandelbrot` that repeats the transformation 

$ z -> z^2 + c "until" |z| "exceeds" 2 "or max iteration" $

The benchmark reveals significant execution speedup
#align(center)[
  #table(
    columns: (auto, auto),
    inset: 8pt,
    stroke: 0.5pt,
    align: left,
    [*Category*], [*Comparison*],
    [Single-Core Performance (Basic Mojo)], [15x faster than Python],
    [Single-Core Performance (Optimized Mojo)], [86x faster than Python],
    [Multi-Core Performance (32 cores, Optimized)], [68,000x faster than Python]
  )
]
#align(center)[
  #v(-9pt)
  #h(51pt)
  #text(size: 9pt)[
    #link("https://www.modular.com/blog/mojo-a-journey-to-68-000x-speedup-over-python-part-3")[ Source: "Mojo: A Journey to 68,000x Speedup Over Python - Part 3", Modular
    ]
  ]
]

== Conclusion

In summary, both MLIR and Mojo bring fresh perspectives to the industry. LLVM's broad ecosystem provides a solid foundation for both technologies to build upon. By embracing these tools together, developers can craft more efficient, adaptable, and innovative software. As hardware and software paradigms continue to evolve, the work being done today with MLIR and Mojo lays the groundwork for more robust compiler solutions in the years to come.


== References

[1] Krzysztof Drewniak, Sarah Rust, Nicolas Vasilache. "Composable and Modular Code Generation in MLIR: A Structured and Retargetable Approach to Tensor Compiler Construction." ResearchGate, 2022.
    https://www.researchgate.net/publication/358422844_Composable_and_Modular_Code_Generation_in_MLIR_A_Structured_and_Retargetable_Approach_to_Tensor_Compiler_Construction
    
[2] Modular. "Mojo: A Journey to 68,000x Speedup Over Python (Part 3)." Modular Blog, 2024.
https://www.modular.com/blog/mojo-a-journey-to-68-000x-speedup-over-python-part-3
