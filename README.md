# deaf-mutes.us/manager

this project deployed via [geektr-cloud/deployer](https://github.com/geektr-cloud/deployer)

## Deploy

```bash
# update (init) project to local enviroment
# when first run, it will init data directory and secrets directory
deployer update deaf-mutes/manager

# edit secrets files
# vim xxxxxx

# up the services
deployer up deaf-mutes/manager

```

## Mysql Backup & Restore
```bash
# backup
docker-compose exec mysql /usr/bin/mysqldump -u root --password=password shadowsocks > backup.sql
# restore
cat backup.sql | docker exec -i manager_mysql_1 /usr/bin/mysql -u root --password=justatest shadowsocks
```
