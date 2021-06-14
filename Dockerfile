FROM alpine:3.13.0

COPY cuppa-1.4-jar-with-dependencies.jar .
COPY cuppa .
COPY LICENSE .

RUN chmod 777 cuppa && \
    apk add openjdk11 python3 && \
    mkdir /usr/local/share/cuppa/ && \
    mv cuppa-1.4-jar-with-dependencies.jar /usr/local/share/cuppa/ && \
    mv cuppa /usr/local/share/cuppa/ && \
    mv LICENSE /usr/local/share/cuppa/ && \
    ln -s /usr/local/share/cuppa/cuppa /usr/local/bin/cuppa