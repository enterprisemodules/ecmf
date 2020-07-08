alias into="docker exec -it ecmf bash"
alias stop="docker kill ecmf"
docker run --rm -d --name ecmf \
  -h ecmf \
  -v $PWD:/root \
  -v $PWD:/etc/puppetlabs/code/modules/ecmf \
  -v $PWD/../easy_type:/etc/puppetlabs/code/modules/easy_type \
  -v software:/software centos:7  /usr/sbin/init
docker exec ecmf rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm
docker exec ecmf rpm -Uvh https://yum.puppet.com/puppet-tools-release-el-7.noarch.rpm
docker exec ecmf yum install puppet-agent puppet-bolt -y
docker exec ecmf cp /software/Universal.entitlements /etc/puppetlabs/puppet/
docker exec ecmf /opt/puppetlabs/puppet/bin/gem install byebug pry --no-ri --no-rdoc
docker exec -it ecmf bash
