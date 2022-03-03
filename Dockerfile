FROM debian:10.9-slim

RUN mkdir -p /usr/local/share/cuppa/ /usr/share/man/man1

COPY cuppa_v1.6.jar /usr/local/share/cuppa/
COPY cuppa /usr/local/share/cuppa/
COPY LICENSE /usr/local/share/cuppa/
COPY CupGenerateReport.R /usr/local/share/cuppa/
COPY install.R /usr/local/share/cuppa/
ADD cuppa-chart /usr/local/share/cuppa/cuppa-chart

RUN chmod 777 /usr/local/share/cuppa/cuppa && \
    chmod 777 /usr/local/share/cuppa/cuppa-chart/cuppa-chart.py && \
    chmod 777 /usr/local/share/cuppa/CupGenerateReport.R && \
    apt update && \
    apt -y install default-jre python3 python3-pip r-base && \
    pip3 install -r /usr/local/share/cuppa/cuppa-chart/requirements.txt && \
    Rscript /usr/local/share/cuppa/install.R && \
    ln -s /usr/local/share/cuppa/cuppa /usr/local/bin/cuppa && \
    ln -s /usr/local/share/cuppa/cuppa-chart/cuppa-chart.py /usr/local/bin/cuppa-chart && \
    ln -s /usr/local/share/cuppa/CupGenerateReport.R /usr/local/bin/CupGenerateReport