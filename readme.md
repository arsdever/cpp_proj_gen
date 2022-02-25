# C++ project generator

This is a sample script which generates a CMake based C++ project in place. Once
triggered, it will generate the following structure and delete itself alongside
this readme file

```
     ╭───────────────╮
╭─┬──┤  Your folder  ├─────────────────────────────╮
│ │  ╰───────────────╯                             │
│ ├─> include                                      │
│ ├─┬─> src                                        │
│ │ └─┬─> main.cpp                                 │
│ │   └─> CMakeLists.txt                           │
│ ├─┬─> test                                       │
│ │ └─┬─> main.cpp                                 │
│ │   └─> CMakeLists.txt                           │
│ ├─> CMakeLists.txt                               │
│ └─> LICENSE                                      │
╰──────────────────────────────────────────────────╯
```
