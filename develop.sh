alias into="docker exec -it ecmf bash"
alias stop="docker kill ecmf"
docker run --rm -d --name ecmf \
  -h ecmf \
  -v $PWD:/root \
  -v $HOME/software:/software \
  -v $PWD:/etc/puppetlabs/code/modules/ecmf \
  -v $PWD/../easy_type:/etc/puppetlabs/code/modules/easy_type \
  centos:7  /usr/sbin/init
docker exec ecmf rpm -Uvh https://yum.puppet.com/puppet7/puppet-release-el-7.noarch.rpm
docker exec ecmf rpm -Uvh https://yum.puppet.com/puppet-tools-release-el-7.noarch.rpm
docker exec ecmf yum install gcc make puppet-agent puppet-bolt -y
docker exec ecmf /opt/puppetlabs/puppet/bin/gem install byebug pry --no-document
docker exec ecmf /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib --force
docker exec ecmf /opt/puppetlabs/bin/puppet module install ipcrm-echo --force
docker exec -it ecmf bash --login
