# RapidOcrOnnxLibTest

### Project下载

* 整合好源码和依赖库的完整工程项目，可以在Release中下载
* 可到Q群共享内下载: Project_RapidOcrOnnxLibTest.7z
* 群号码请到主项目查看：https://github.com/RapidAI/RapidOCR
* C lib 编译：https://github.com/RapidAI/RapidOcrOnnx/releases

### 介绍

* 本项目为RapidOcrOnnx 动态运行库的调用范例。

### 依赖项下载

1. 下载OcrLib，[下载地址](https://github.com/RapidAI/RapidOcrOnnx/releases)

* 文件名：平台-clib-.7z，
* 把压缩包解压到OcrLib目录，windows平台需要注意目录层次，解压后目录结构如下

```
OcrLib
├── Darwin-CLIB-CPU
│ ├── OcrLibConfig.cmake
│ ├── include
│ └── lib
├── Linux-CLIB-CPU
│ ├── OcrLibConfig.cmake
│ ├── include
│ └── lib
├── OcrLibWrapper.cmake
├── win-CLIB-CPU-Win32
│ ├── OcrLibConfig.cmake
│ ├── bin
│ ├── include
│ └── lib
└── win-CLIB-CPU-x64
    ├── OcrLibConfig.cmake
    ├── bin
    ├── include
    └── lib
```

### 编译环境

1. Windows 10 x64 + vs2019 + cmake(请自行安装)
2. macOS 10.15
3. Linux Ubuntu 1804 x64

### 编译说明

* windows双击build.bat，Linux&Mac ./build.sh
* 选择编译选项
* 按照编译完成的提示运行run-test脚本查看测试结果

### 注意事项for windows

* 如果是直接从github点击"download zip"按钮下载的代码，文件默认格式是Linux的
* 此时，需要把工程内的所有bat文件用UE等文本编辑器改为windows格式

### Windows调试运行

* 下载范例项目工程自带的dll是Release版，不能用于调试运行
* 调试运行需要debug版的onnxruntime + opencv，并编译成debug版的Ocr库，根据需要自行编译x64或x86版
* 把debug版的Ocr库替换到OcrLib文件夹中
* 双击generate-vs-project.bat，选择2)Debug，生成对应的build-win-vsxxx-xx文件夹
* 进入生成的文件夹，打开OcrLibTest.sln
* 右边解决方案管理器，选中OcrLibTest，右键->设为启动项目，并生成(查看输出log，确保生成成功)
* 把OcrLib里对应的dll文件，例RapidOcrOnnx.dll复制到build-win-vsxxx-xx文件夹\Debug，跟上一步生成的OcrLibTest.exe放在一起
* 把resource文件夹里的images文件夹和models文件夹复制到build-win-vsxxx-xx文件夹
* 工具栏，点击绿色三角号启动"本地Windows调试器"
* 第一次运行的话，查看左下角，等待加载各dll符号，网络不好的话，要等挺久的