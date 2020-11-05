puppet
alias puppet=/opt/puppetlabs/bin/puppet 
puppet apply -e "include ecmf::roles::postgres_server"
puppet apply -e "include ecmf::roles::database::postgres_server"
puppet module install ipcrm-echo
puppet module install enterprisemodules-easy_type
puppet apply -e "include ecmf::roles::database::postgres_server"
puppet apply -e "include ecmf::roles::database::postgres_server"
puppet apply -e "include ecmf::roles::database::postgres_server"
puppet apply -e "include ecmf::roles::database::mysql_server"
puppet apply -e "include ecmf::roles::database::nagios_server"
puppet apply -e "include ecmf::roles::monitoring::nagios_server"
puppet apply -e "include ecmf::roles::monitoring::zabbix_server"
