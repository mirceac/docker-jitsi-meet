FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

USER root

COPY build/build.sh build/build.sh
COPY start.sh start.sh
RUN build/build.sh

EXPOSE 443 5347
EXPOSE 10000/udp 10001/udp 10002/udp 10003/udp 10004/udp 10005/udp 10006/udp 10007/udp 10008/udp 10009/udp 10010/udp

CMD ["./start.sh"]
