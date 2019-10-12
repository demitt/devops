FROM tomcat:9.0.26-jdk8-openjdk

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

ARG TOMCAT_MANAGER_SCRIPT_USER
ARG TOMCAT_MANAGER_SCRIPT_PASS
ARG TOMCAT_MANAGER_GUI_USER
ARG TOMCAT_MANAGER_GUI_PASS
RUN sed -i -e " \
        s@<!--USER-GUI-PLACEHOLDER-->@<user username=\"$TOMCAT_MANAGER_GUI_USER\" password=\"$TOMCAT_MANAGER_GUI_PASS\" roles=\"manager-gui\"/>@; \
        s@<!--USER-SCRIPT-PLACEHOLDER-->@<user username=\"$TOMCAT_MANAGER_SCRIPT_USER\" password=\"$TOMCAT_MANAGER_SCRIPT_PASS\" roles=\"manager-script\"/>@ \
    " /usr/local/tomcat/conf/tomcat-users.xml
