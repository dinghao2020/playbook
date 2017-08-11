#!/bin/bash

tomcat_url=http://10.130.21.95:5892/apache-tomcat-8.5.20.tar.gz
tomcat_version_dir=/usr/locat/tomcat8
install_tomcat(){
	wget -c  -O /tmp/tomcat.tar.gz  ${tomcat_url}
	test -d ${tomcat_version_dir} || mkdir -pv ${tomcat_version_dir}
	tar -xf /tmp/tomcat.tar.gz  -C ${tomcat_version_dir}/
	ln -svf ${tomcat_version_dir}/apache-tomcat-8*  ${tomcat_version_dir}/tomcat

}

/bin/bash -x install_jdk.sh
tomcat_dir=`ps -ef|egrep tomcat|egrep -v grep|head -n 1|awk -F"=| " '{print $(NF-4)}'`
test -z ${tomcat_dir} || install_tomcat
