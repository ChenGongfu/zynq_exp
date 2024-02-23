# 1.实验背景
这是 Xilinx FPGA 开发的一个实验记录

如果你想深入 Xilinx FPGA，需要常查看 Xilinx UG ,Xilinx 提供了 DOCNAV 程序来管理手册。

# 2.实验目的
1.  学习基本的 verilog 语法
2.  学习 Vivado 的 gui 流程
3.  学习 Vivado 的 script 流程
4.  学习基本的 simulation 流程
5.  学习 ILA 调试的使用
6.  学习 VIO 的使用

# 3. 实验原理

## 0. 基本的 verilog 语法
单独出几个个文档总结：
coming soon

## 1. 安装 xilinx vitis,并在 docnav 中下载好UG
搜索 tcl, 打开 'Vivado Design Suite TclCommand Reference Guide' 文档，里面有详细的 vivado tcl 使用教程


# 4. 实验过程
## 4.1 在 windows powershell 中以 tclsh 的形式启动 vivado

```powershell
vivado.bat -mode tcl
```

输出：

```
vivado : 无法将“vivado”项识别为 cmdlet、函数、脚本文件或可运行程序的名称。请检查名称的拼写，如果包括路径，请确保路径
正确，然后再试一次。
所在位置 行:1 字符: 1
+ vivado -mode tcl
+ ~~~~~~
    + CategoryInfo          : ObjectNotFound: (vivado:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
```

这是因为我们没有把 vivado 加入环境变量，在环境变量 `Path` 中添加：`C:\Xilinx\Vivado\2023.2\bin`

## 4.2 创建工程

```bash
create_project -part "xc7z020clg400-2" -verbose "01_pl_led" "."
```

创建 fileset ,添加文件

```bash
create_fileset -constrset constr_1
create_fileset -simset sim_1

add_files -fileset constr_1 {../../xc7z020clg400.xdc}
add_files -fileset sim_1 {../../tb_pl_led.v}
add_files -scan_for_includes {../../pl_led.v}

check_syntax

```

## 4.3 创建运行 flow

# 5. 结果与总结

# 6. 不足与改进

# 7.参考文献/进一步阅读