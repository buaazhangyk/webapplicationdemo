#!/bin/sh
TOMCAT_HOME=/opt/soft/tomcat
echo $(cd "$(dirname $0)"; pwd)
CATALINA_BASE=$(cd "$(dirname $0)"; pwd)
CATALINA_PID=$CATALINA_BASE/tomcat.pid

JAVA_HOME=/opt/soft/jdk1.8.0_92
CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
PATH=$PATH:$JAVA_HOME/bin

WF_USPCLUSTER=`echo $CATALINA_BASE | awk -F "/" '{print $NF}'`
echo "Using WF.uspcluster: $WF_USPCLUSTER"

JAVA_OPTS="-server -Xms2g -Xmx2g -Xmn1g -Xss1024K -XX:PermSize=256m -XX:MaxPermSize=512m -XX:ParallelGCThreads=8 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:SurvivorRatio=4 -XX:MaxTenuringThreshold=10 -XX:CMSInitiatingOccupancyFraction=80 -DWF.uspcluster=$WF_USPCLUSTER"
JAVA_OPTS="$JAVA_OPTS -Duser.dir=/opt/web/dianshangwuxian_dop_comment_web"

export TOMCAT_HOME CATALINA_BASE CATALINA_PID JAVA_HOME CLASSPATH PATH JAVA_OPTS WF_USPCLUSTER
JAVA_OPTS="$JAVA_OPTS -Duser.dir=/opt/web/dianshangwuxian_dop_comment_web"

proj_dir=`basename $CATALINA_BASE`
if [[ -n "$proj_dir" ]]
then
        ps aux | egrep -w "\<$proj_dir\>" | grep -v "grep" | grep -v "$CATALINA_BASE/\(start.sh\|stop.sh\|restart.sh\|logs/catalina.out\)" | grep -v "release" | grep -v "sshd" > /dev/null
        status=$?

        if  [[ $status -eq 0 ]] && [[ -s $CATALINA_PID  ]]
        then
                echo "The $proj_dir tomcat is running and the pid_file is exist !"
                exit 1
        elif [[ $status -eq 0 ]] || [[ -s $CATALINA_PID  ]]
        then
                echo "kill one"
                ps aux | egrep -w "\<$proj_dir\>" | grep -v "grep" | grep -v "$CATALINA_BASE/\(start.sh\|stop.sh\|restart.sh\|logs/catalina.out\)" | grep -v "release" | grep -v "sshd" | awk '{print $2}' | xargs -i kill -9 {}
                > $CATALINA_PID
                /opt/soft/tomcat/bin/catalina.sh start
        else
                /opt/soft/tomcat/bin/catalina.sh start
        fi

else
        echo "start failt!!!"
        exit 1

fi
