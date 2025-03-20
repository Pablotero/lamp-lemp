#!/bin/bash
#Script para facer backup da BD
DB_HOST="$MYSQL_HOST"
DB_PORT="$MYSQL_PORT"
DB_NAME="$MYSQL_DATABASE"
DB_USER="$MYSQL_USER"
DB_PASSWORD="$MYSQL_PASSWORD"
BACKUP_DIR="/basededatos"
BACKUP_FILE="$BACKUP_DIR/backup-bd.sql"

mkdir -p $BACKUP_DIR
mysqldump --host=$DB_HOST --port=$DB_PORT --user=$DB_USER --password=$DB_PASSWORD --ssl-mode=VERIFY_CA --result-file=$BACKUP_FILE $DB_NAME
if [ $? -eq 0 ]; then
    echo "Backup creado en: $BACKUP_FILE"
else
    echo "Error al realizar el backup."
fi
