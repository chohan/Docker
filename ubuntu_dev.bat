docker run --rm -d -t -v /C_DRIVE:/c -v /D_DRIVE:/d -v /E_DRIVE:/e -p 2222:22 --expose 9001 -p 9001:9001 --expose 9002 -p 9002:9002 --expose 9003 -p 9003:9003 --privileged -v /dev/bus/usb:/dev/bus/usb --cap-add=SYS_PTRACE --security-opt seccomp=unconfined ubuntu_dev:20190826
docker ps
pause

# --privileged -v /dev/bus/usb:/dev/bus/usb (for usb access inside docker)
# --cap-add=SYS_PTRACE --security-opt seccomp=unconfined  (to run gdb)
