@echo off
setlocal enabledelayedexpansion

rem 获取当前目录下的所有 .bin 文件
for %%f in (stage2_*.bin) do (
    rem 获取文件名中的数字部分，去掉小数点
    set "filename=%%~nf"
    set "num=!filename:stage2_=!"
    set "num=!num:.=!"
    
    rem 创建一个以纯数字命名的文件夹
    mkdir "!num!"

    rem 将文件复制到新建的文件夹中并重命名为 stage2.bin
    copy "%%f" "!num!\stage2.bin"
)

echo 所有文件已处理完成。
pause
