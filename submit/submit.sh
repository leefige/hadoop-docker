#!/bin/bash

/wait-for-step.sh

/execute-step.sh

echo "Submit application ${JAR_FILEPATH} with main class ${CLASS_TO_RUN} to Hadoop mapred"
echo "Passing arguments ${PARAMS}"
$HADOOP_PREFIX/bin/hadoop jar $JAR_FILEPATH $CLASS_TO_RUN $PARAMS

/finish-step.sh
