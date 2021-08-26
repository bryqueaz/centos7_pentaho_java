FROM centos:7.5.1804

## Variables de ambiente
ENV MAJOR_VERSION 'Pentaho 8.3'
ENV MINOR_VERSION 8.3.0.0-371
ENV PENTAHO_HOME /opt/pentaho

## Instalacion de paquetes
## Descarga jre de java y los instala
RUN  yum install wget curl zip unzip -y;  echo \"https://javadl.oracle.com/webapps/download/AutoDL?xd_co_f=MWUxZWUzYjctMjdiZS00YzA1LWI2MDMtNjMyNDQxN2FjMWMy\&BundleId=242979_a4634525489241b9a9e1aa73d9e118e6\"  | xargs wget -qO- -O /tmp/jre-8u261.rpm; \
	 rpm -iv /tmp/jre-8u261.rpm; rm -f /tmp/jre-8u261.rpm;

## Descarga Pentaho y lo configura
##RUN echo  \"https://sourceforge.net/projects/pentaho/files/${MAJOR_VERSION}/server/pentaho-server-ce-${MINOR_VERSION}.zip/download\" | xargs wget -qO- -O /tmp.zip && \
##    unzip -q /tmp.zip -d /opt; rm -f /tmp.zip;  mv /opt/pentaho-server ${PENTAHO_HOME}; rm -f ${PENTAHO_HOME}/promptuser.sh; sed -i -e 's/\(exec ".*"\) start/\1 run/' ${PENTAHO_HOME}/tomcat/bin/startup.sh;

##VOLUME   ${PENTAHO_HOME}
##WORKDIR  ${PENTAHO_HOME}


EXPOSE 8080

CMD ["sh", "/opt/pentaho/start-pentaho.sh"]

##ENTRYPOINT ["sh", "/opt/pentaho/start-pentaho.sh"]
