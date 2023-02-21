FROM debian:10.9-slim

RUN mkdir -p /usr/local/share/cuppa/ /usr/share/man/man1

COPY cuppa /usr/local/share/cuppa/
COPY cuppa-chart-wrapper /usr/local/share/cuppa/
COPY CupGenerateReport /usr/local/share/cuppa/
COPY install.R /usr/local/share/cuppa/

RUN apt update && \ 
    apt -y install default-jre python3 python3-pip r-base wget && \
    wget https://github.com/hartwigmedical/hmftools/releases/download/cuppa-v1.7.1/cuppa.jar && \
    mv -t /usr/local/share/cuppa/ cuppa.jar && \
    wget https://github.com/hartwigmedical/hmftools/archive/refs/tags/cuppa-v1.7.1.zip && \
    unzip cuppa-v1.7.1.zip && \
    mv -t /usr/local/share/cuppa \
      hmftools-cuppa-v1.7.1/cuppa/src/main/resources/cuppa-chart \
      hmftools-cuppa-v1.7.1/cuppa/src/main/resources/r/CupGenerateReport_pipeline.R \
      hmftools-cuppa-v1.7.1/LICENSE && \
    rm -r hmftools-cuppa-v1.7.1 cuppa-v1.7.1.zip && \
    pip3 install -r /usr/local/share/cuppa/cuppa-chart/requirements.txt && \
    Rscript /usr/local/share/cuppa/install.R && \
    chmod 755 /usr/local/share/cuppa/cuppa && \
    chmod 755 /usr/local/share/cuppa/cuppa-chart-wrapper && \
    chmod 755 /usr/local/share/cuppa/CupGenerateReport && \
    ln -s /usr/local/share/cuppa/cuppa /usr/local/bin/cuppa && \
    ln -s /usr/local/share/cuppa/cuppa-chart-wrapper /usr/local/bin/cuppa-chart && \
    ln -s /usr/local/share/cuppa/CupGenerateReport /usr/local/bin/CupGenerateReport
