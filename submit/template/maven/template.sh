#!/bin/bash

cd /opt/hadoop/applications
cp target/${JAR_NAME}.jar ${JAR_FILEPATH}

sh /submit.sh
