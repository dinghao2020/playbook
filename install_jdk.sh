#!/bin/bash

jdk_url=http://10.130.21.95:5892/jdk-7u80-linux-x64.tar.gz
install_jdk(){
	wget -c  -O /tmp/jdk.gz  ${jdk_url}
	test -d /usr/java || mkdir -pv /usr/java
	tar -xf /tmp/jdk.gz -C /usr/java/
	ln -svf /usr/java/jdk1.* /usr/java/jdk

	cat >> /etc/profile <<- EOF
	export JAVA_HOME=/usr/java/jdk
	export JRE_HOME=\${JAVA_HOME}/jre
	export CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib
	export PATH=\${JAVA_HOME}/bin:\$PATH
	EOF

	update-alternatives --install /usr/bin/java java /usr/java/jdk/bin/java 1  
	update-alternatives --install /usr/bin/javac javac /usr/java/jdk/bin/javac 1  
	update-alternatives --install /usr/bin/jar jar /usr/java/jdk/bin/jar 1 


	source /etc/profile
	sleep 2
	java -version && echo "Jdk install success !!! " || echo "Jdk install failed,Please check! "
}

source /etc/profile	
which java || install_jdk
