FROM ubuntu:22.04

COPY install_tools.sh    /
RUN bash /install_tools.sh && rm /install_tools.sh  