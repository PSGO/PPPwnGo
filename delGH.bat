@echo off
setlocal enabledelayedexpansion

rem 定义要删除的关键字列表
set "keywords=9.00 900 9.60 960 10.00 1000 10.01 1001 11.00 1100"

rem 遍历当前目录下的所有文件夹
for /d %%d in (*) do (
    rem 检查文件夹名称是否包含任何关键字
    set "foldername=%%d"
    set "deleteFlag=0"
    for %%k in (%keywords%) do (
        if "!foldername:%%k=!" neq "!foldername!" (
            set "deleteFlag=1"
        )
    )
    rem 如果文件夹名称包含关键字，则删除该文件夹
    if "!deleteFlag!"=="1" (
        echo 正在删除文件夹 %%d
        rd /s /q "%%d"
    )
)

echo 所有指定的文件夹已删除。
pause
