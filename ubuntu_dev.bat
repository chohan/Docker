docker run --rm -d -t -v /C_DRIVE:/c -v /D_DRIVE:/d -v /E_DRIVE:/e -p 2222:22 --expose 9001-9003 --expose 9090 -p 9001:9001 -p 9002:9002 -p 9003:9003 -p 9090:9090  --privileged -v /dev/bus/usb:/dev/bus/usb --cap-add=SYS_PTRACE --security-opt seccomp=unconfined shchohan/ubuntu_dev:20190924
docker ps
pause

:: --privileged -v /dev/bus/usb:/dev/bus/usb (for usb access inside docker)
:: --cap-add=SYS_PTRACE --security-opt seccomp=unconfined  (to run gdb)


:: docker-compose -f D:\Projects\ACCS\ubuntu_dev.yml up -d
:: docker-compose -f D:\Projects\ACCS\ubuntu_dev.yml down