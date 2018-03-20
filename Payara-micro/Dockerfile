FROM payara/micro:latest

MAINTAINER black-root <ronald_reir21@hotmail.com>

ENV PATH $PATH:$PAYARA_PATH/bin

ADD connector/mysql-connector-java-5.1.46-bin.jar  /opt/payara41/glassfish/domains/domain1/lib/ext/

RUN asadmin start-domain && asadmin create-jdbc-connection-pool --user admin --passwordfile /opt/pwdfile \
--datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.DataSource --steadypoolsize=2 --maxpoolsize=2 \
--property user=root:password=1234:DataBaseName=mantenimientoPC:ServerName=localhost:port=3306:driverClass=com.mysql.jdbc.Driver mantenimientoTpi2018 && \
asadmin create-jdbc-resource --user admin --passwordfile /opt/pwdfile \
--connectionpoolid matenimientoTpi2018 --enabled=true mantenimientoJdni2018

ADD TramitesAcademicaMavenApp-ear-1.0-SNAPSHOT.ear /opt/payara41/glassfish/domains/domain1/autodeploy 
#COPY  /opt/payara41/glassfish/domains/domain1/autodeploy 

EXPOSE 4848 8080

CMD ["asadmin", "start-domain", "-v"]
