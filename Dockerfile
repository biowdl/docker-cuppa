FROM debian:10.9-slim

RUN mkdir -p /usr/local/share/cuppa/ /usr/share/man/man1

COPY cuppa-1.4-jar-with-dependencies.jar /usr/local/share/cuppa/
COPY cuppa /usr/local/share/cuppa/
COPY LICENSE /usr/local/share/cuppa/
ADD cuppa-chart /usr/local/share/cuppa/cuppa-chart

RUN chmod 777 /usr/local/share/cuppa/cuppa && \
    chmod 777 /usr/local/share/cuppa/cuppa-chart/cuppa-chart.py && \
    apt update && \
    apt -y install default-jre python3 python3-pip && \
    pip3 install -r /usr/local/share/cuppa/cuppa-chart/requirements.txt && \
    ln -s /usr/local/share/cuppa/cuppa /usr/local/bin/cuppa && \
    ln -s /usr/local/share/cuppa/cuppa-chart/cuppa-chart.py /usr/local/bin/cuppa-chart