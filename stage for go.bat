@echo off
setlocal enabledelayedexpansion

rem 遍历当前目录下所有符合条件的 .bin 文件
for %%f in (stage2_*.bin) do (
    rem 获取文件名中的数字部分（包括小数点）
    set "filename=%%~nf"
    set "num=!filename:stage2_=!"
    
    rem 创建外部文件夹，名称格式为 PS4-数字（带小数点）
    mkdir "PS4-!num!"
    
    rem 在外部文件夹内创建一个名为 stage2 的文件夹
    mkdir "PS4-!num!\stage2"

    rem 将文件复制到 stage2 文件夹中并重命名为 stage2.bin
    copy "%%f" "PS4-!num!\stage2\stage2.bin"
)

echo 所有文件已处理完成。
pause
