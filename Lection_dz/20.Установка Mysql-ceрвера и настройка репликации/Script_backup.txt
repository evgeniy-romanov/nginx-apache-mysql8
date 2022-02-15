#!/bin/bash
DB_host=localhost
DB_user=root
DB=dbtest
DIR='/root/backup'
DB_pass='2152*qaZ'

echo "Dumping tables into separate SQL command files for database '$DB' into dir=$DIR"
tbl_count=0
for t in $(mysql -NBA -h $DB_host -u $DB_user -p$DB_pass -D $DB -e 'show tables')
do
    echo "DUMPING TABLE: $DB.$t"
    mysqldump -h $DB_host -u $DB_user -p$DB_pass $DB $t | gzip > $DIR/$DB.$t.sql.gz
    tbl_count=$(( tbl_count + 1 ))
done
echo "$tbl_count tables dumped from database '$DB' into dir=$DIR"