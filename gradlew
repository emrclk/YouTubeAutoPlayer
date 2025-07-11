#!/bin/bash
##############################################################################
##  Gradle startup script for UN*X                                          ##
##############################################################################

# Attempt to locate JAVA
if [ -z "$JAVA_HOME" ]; then
  JAVA_EXEC=java
else
  JAVA_EXEC="$JAVA_HOME/bin/java"
fi

# Execute the wrapper JAR
"$JAVA_EXEC" -jar "$(dirname "$0")/gradle/wrapper/gradle-wrapper.jar" "$@"