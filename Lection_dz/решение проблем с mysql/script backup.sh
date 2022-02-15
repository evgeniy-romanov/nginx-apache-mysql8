#!/bin/bash
MYSQL_DB=db_name
MYSQL_USER=user
MYSQL_PASS='pass'
TIME=$(/bin/date +%Y-%m-%d-%T)
DUMP=$MYSQL_DB-$TIME.sql.gz


cd /backup
#backup mysql
mysqldump -u $MYSQL_USER -p$MYSQL_PASS $MYSQL_DB --no-tablespaces | gzip -9 >$DUMP

ionice -c3 find /backup/ -type f -mtime +7 -exec rm -f {} \;  >/dev/null 2>&1 # Удалить файлы старше 7 дней