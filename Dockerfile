FROM bash:4.4
COPY ./.bashrc /root/.
CMD ["/usr/local/bin/bash", "-c", "source /root/.bashrc"]
#SHELL ["/bin/bash", "-c"]
#USER salah
#ENV HOME /home/salah
#RUN apt-get update && apt-get install -y \
#        curl \
#        vim \
#        net-tools \
#        git \
#        iputils-ping \
#        wget


# build
#docker build -t salah-bash .
#docker run --rm -it --name salah-bash-running salah-bash

