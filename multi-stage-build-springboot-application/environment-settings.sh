#!/bin/bash

JVM_OPTIONS="$JVM_OPTIONS -agentlib:jdwp=transport=dt_socket,address=*:8000,server=y,suspend=n"

JVM_OPTIONS="$JVM_OPTIONS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=3333 -Dcom.sun.management.jmxremote.rmi.port=3333 -Djava.rmi.server.hostname=localhost"

JVM_OPTIONS="$JVM_OPTIONS -Xms512m"
JVM_OPTIONS="$JVM_OPTIONS -Xmx512m"

APPLICATION_DIRECTORY=/application

JVM_OPTIONS="$JVM_OPTIONS -XX:+UnlockDiagnosticVMOptions"
JVM_OPTIONS="$JVM_OPTIONS -XX:+LogVMOutput"
JVM_OPTIONS="$JVM_OPTIONS -XX:LogFile=$APPLICATION_DIRECTORY/log/vmoutput.log"

JVM_OPTIONS="$JVM_OPTIONS -DlogDir=$APPLICATION_DIRECTORY/log/"
JVM_OPTIONS="$JVM_OPTIONS -DlogLevel=info"
JVM_OPTIONS="$JVM_OPTIONS -DlogName=spring-data-jpa-tutorial-0.0.1-SNAPSHOT"
JVM_OPTIONS="$JVM_OPTIONS -DlogAppender=FILE"

JVM_OPTIONS="$JVM_OPTIONS -XX:+HeapDumpOnOutOfMemoryError"
JVM_OPTIONS="$JVM_OPTIONS -XX:HeapDumpPath=$LOG_DIR/log"


if [ -r "$APP_HOME/environment-variables-settings.sh" ]; then
  . "$APP_HOME/environment-variables-settings.sh"
fi

export JVM_OPTIONS=$JVM_OPTIONS
export _JAVA_OPTIONS=$JVM_OPTIONS
exec "$@"
