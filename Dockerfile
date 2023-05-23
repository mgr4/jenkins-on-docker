FROM jenkins/jenkins:2.387.3-lts-alpine

USER root

# Switch back to the Jenkins user
USER jenkins

# Disable Jenkins setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Specify Jenkins home directory
ENV JENKINS_HOME /var/jenkins_home

# Copy plugin list file
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install Jenkins plugins
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt --verbose

