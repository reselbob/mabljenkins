FROM jenkins/jenkins
USER root
EXPOSE 8080

RUN npm i -g @mablhq/mabl-cli

RUN curl --silent --location https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get update && apt-get install -y \ 
       apt-utils \
       libltdl7 \
       npm \
       dnsutils \
    && rm -rf /var/lib/apt/lists/*
