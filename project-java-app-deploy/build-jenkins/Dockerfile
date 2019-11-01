FROM jenkins/jenkins:lts
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat /plugins.txt | tr '\n' ' ')

USER root
RUN \
    rm -f  /plugins.txt && \
    mkdir /var/jenkins_home/init.groovy.d && \
    apt-get update && \
    apt-get install -y nano
USER jenkins

COPY groovy-scripts/* /var/jenkins_home/init.groovy.d/

# Add custom plugins' configurations
COPY --chown=jenkins:jenkins plugin-configs/* /var/jenkins_home/

# Skipping Jenkins default setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
