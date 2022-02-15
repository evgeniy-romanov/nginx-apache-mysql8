[root@master ~]# ls -l backup/
итого 0
[root@master ~]# cat test.sh 
#!/bin/bash
DB_host=localhost
DB_user=root
DB=dbtest
DIR='/root/backup'
DB_pass='Qaz/2152'

echo "Dumping tables into separate SQL command files for database '$DB' into dir=$DIR"
tbl_count=0
for t in $(mysql -NBA -h $DB_host -u $DB_user -p$DB_pass -D $DB -e 'show tables')
do
    echo "DUMPING TABLE: $DB.$t"
    mysqldump -h $DB_host -u $DB_user -p$DB_pass $DB $t | gzip > $DIR/$DB.$t.sql.gz
    tbl_count=$(( tbl_count + 1 ))
done
echo "$tbl_count tables dumped from database '$DB' into dir=$DIR"
[root@master ~]# bash test.sh 
Dumping tables into separate SQL command files for database 'dbtest' into dir=/root/backup
mysql: [Warning] Using a password on the command line interface can be insecure.
DUMPING TABLE: dbtest.Persons
mysqldump: [Warning] Using a password on the command line interface can be insecure.
DUMPING TABLE: dbtest.Test
mysqldump: [Warning] Using a password on the command line interface can be insecure.
DUMPING TABLE: dbtest.User
mysqldump: [Warning] Using a password on the command line interface can be insecure.
3 tables dumped from database 'dbtest' into dir=/root/backup
[root@master ~]# ls -l backup/
итого 12
-rw-r--r-- 1 root root 681 дек  9 19:19 dbtest.Persons.sql.gz
-rw-r--r-- 1 root root 682 дек  9 19:19 dbtest.Test.sql.gz
-rw-r--r-- 1 root root 682 дек  9 19:19 dbtest.User.sql.gz