bundle exec rake litmus
export TARGET_HOST=$(grep container_id inventory.yaml | awk '{ print $2}')
docker exec $TARGET_HOST bash -c 'echo "export LANG=en_US.UTF-8" >> /root/.bashrc'
# This is to take care of this error.
# Error: /Stage[main]/Postgresql::Server::Reload/Exec[postgresql_reload]: Failed to call refresh: invalid byte sequence in US-ASCII
# Error: /Stage[main]/Postgresql::Server::Reload/Exec[postgresql_reload]: invalid byte sequence in US-ASCII
