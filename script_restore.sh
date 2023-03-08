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
su - gpadmin -c "echo \"host    all     gpadmin 0.0.0.0/0       trust\" >> \$MASTER_DATA_DIRECTORY/pg_hba.conf"
su - gpadmin -c  "gpstop -u"
sudo rpm -Uvh /home/gpadmin/greenplum-cluster-recovery-1.0.0+beta.2-1.el7.x86_64.rpm
sudo chown -R gpadmin:gpadmin /usr/local/gpcr
echo 'export PATH=$PATH:/usr/local/gpcr/bin' >> ~/.bashrc
source ~/.bashrc
su - gpadmin -c "echo 'export PATH=\$PATH:/usr/local/gpcr/bin' >> ~/.bashrc"
su - gpadmin -c "source ~/.bashrc"
su - gpadmin -c "gpstop -af"
su - gpadmin -c "rm -rf /gpdb/gpdata1 && rm -rf /gpdb/gpdata2 && rm -rf /gpdb/gpdata3 && rm -rf /gpdb/gpdata4 && rm -rf /gpdb/gpmaster"
su - gpadmin -c  "gpcr configure restore --stanza-config-file /home/gpadmin/s3_stanza_config_file.yml --restore-config-file /home/gpadmin/restore_config_file.yml --debug"
#tail -f /dev/null
