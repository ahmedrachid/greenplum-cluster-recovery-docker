#!/bin/bash
su - gpadmin -c "gpstart -qa"
su - gpadmin -c "gpstop -a"
cd /home/gpadmin
yum -y install sudo
sudo yum -y install compat-openssl10
sudo yum -y --allowerasing install /home/gpadmin/greenplum-db-6.23.1-rhel8-x86_64.rpm
sudo chown -R gpadmin:gpadmin /usr/local/greenplum*
sudo chown -R gpadmin:gpadmin /home/gpadmin*
sudo chown -R gpadmin:gpadmin /usr/local/greenplum-db-6.23.1
rm -f /usr/local/greenplum-db
ln -s /usr/local/greenplum-db-6.23.1 /usr/local/greenplum-db
source /usr/local/greenplum-db/greenplum_path.sh
source ~/.bashrc
su - gpadmin -c "/usr/local/greenplum-db/greenplum_path.sh"
su - gpadmin -c "source ~/.bashrc"
su - gpadmin -c "gpstart -qa"
tail -f /dev/null