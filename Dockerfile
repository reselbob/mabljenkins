FROM jenkins/jenkins:latest
USER root
EXPOSE 8080

# install jenkins plugins
COPY ./jenkins-plugins /usr/share/jenkins/plugins
RUN while read i ; \
		do /usr/local/bin/install-plugins.sh $i ; \
	done < /usr/share/jenkins/plugins

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# allows to skip Jenkins setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Jenkins runs all grovy files from init.groovy.d dir
# use this for creating default admin user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# volume for Jenkins settings
VOLUME /var/jenkins_home

RUN curl --silent --location https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get update && apt-get install -y \ 
       apt-utils \
       libltdl7 \
       npm \
       dnsutils \
    && rm -rf /var/lib/apt/lists/*

RUN npm i -g @mablhq/mabl-cli
