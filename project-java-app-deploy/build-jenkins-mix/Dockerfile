# IS NOT READY


FROM ubuntu:18.04

# To avoid "apt-key output should not be parsed (stdout is not a terminal)" warning.
#ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=AnyNonEmptyValue
# It has not been tested yet.

RUN \
    apt-get -y update && \
    apt-get -y install software-properties-common wget && \
    \
    add-apt-repository -y ppa:openjdk-r/ppa && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    \
    apt-get -y update && \
    apt-get -y install openjdk-8-jre jenkins nano

COPY plugins.txt /plugins.txt
#COPY createAdmin.groovy /var/jenkins_home/init.groovy.d/createAdmin.groovy

RUN \
    wget -O /install-plugins.sh https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh && \
    chmod +x /install-plugins.sh && \
    # install-plugins.sh says "line 26: /usr/local/bin/jenkins-support: No such file or directory".
    # Probably, install-plugins.sh is not usable in our case.
    #/install-plugins.sh $(cat /plugins.txt | tr '\n' ' ') && \
    rm -f /plugins.txt

# Skipping Jenkins default setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
