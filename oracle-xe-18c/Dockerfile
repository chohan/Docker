# https://github.com/fuzziebrain/docker-oracle-xe
# https://download.oracle.com/otn/linux/oracle18c/xe/oracle-database-xe-18c-1.0-1.x86_64.rpm
FROM oraclelinux:7-slim
LABEL MAINTAINER="Adrian Png <adrian.png@fuzziebrain.com>"

ENV \
  # The only environment variable that should be changed!
  ORACLE_PASSWORD=Oracle18 \
  EM_GLOBAL_ACCESS_YN=Y \
  # DO NOT CHANGE 
  ORACLE_DOCKER_INSTALL=true \
  ORACLE_SID=XE \
  ORACLE_BASE=/opt/oracle \
  ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE \
  ORAENV_ASK=NO \
  RUN_FILE=runOracle.sh \
  SHUTDOWN_FILE=shutdownDb.sh \
  EM_REMOTE_ACCESS=enableEmRemoteAccess.sh \
  EM_RESTORE=reconfigureEm.sh \
  ORACLE_XE_RPM=oracle-database-xe-18c-1.0-1.x86_64.rpm \
  CHECK_DB_FILE=checkDBStatus.sh
    
COPY ./${ORACLE_XE_RPM} /tmp/

RUN yum install -y oracle-database-preinstall-18c && \
  yum install -y /tmp/${ORACLE_XE_RPM} && \
  yum install -y less vim tzdata && \
  rm -rf /tmp/${ORACLE_XE_RPM}

COPY ./oracle-xe-18c/scripts/*.sh ${ORACLE_BASE}/scripts/

# config files
ADD https://raw.githubusercontent.com/chohan/Linux-script/master/.bashrc /root/.
ADD https://raw.githubusercontent.com/chohan/Linux-script/master/.vimrc /root/.
COPY oracle-xe-18c/Dockerfile	/root/.

# Environment
RUN echo "export PATH=$PATH:/d/Tools:/opt/oracle/product/18c/dbhomeXE/bin" >> /etc/environment

RUN chmod a+x ${ORACLE_BASE}/scripts/*.sh 

# password file
#RUN mkdir -p /opt/oracle/oradata
#RUN chown -R 54321:54321 /opt/oracle/oradata
RUN mkdir -p /opt/oracle/product/18c/dbhomeXE/dbs
COPY orapwXE /opt/oracle/product/18c/dbhomeXE/dbs/.
RUN chown 54321:54321 /opt/oracle/product/18c/dbhomeXE/dbs/orapwXE


# 1521: Oracle listener
# 5500: Oracle Enterprise Manager (EM) Express listener.
EXPOSE 1521 5500

VOLUME [ "${ORACLE_BASE}/oradata" ]

HEALTHCHECK --interval=1m --start-period=2m --retries=10 \
  CMD "$ORACLE_BASE/scripts/$CHECK_DB_FILE"

CMD exec ${ORACLE_BASE}/scripts/${RUN_FILE}

# docker build -f oracle-xe-18c/Dockerfile -t oracle-xe:18c .
