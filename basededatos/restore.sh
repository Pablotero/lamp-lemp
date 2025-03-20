#!/bin/bash
#Script para restaurar a BD
BACKUP_FILE="$1"
if [ -z "$BACKUP_FILE" ]; then
    echo "Uso: $0 <archivo.sql>"
    exit 1
fi
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: El archivo no existe ($BACKUP_FILE)."
    exit 1
fi
mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_USER --password=$DB_PASSWORD --ssl-mode=VERIFY_CA $DB_NAME < "$BACKUP_FILE"
if [ $? -eq 0 ]; then
    echo "Backup restaurado correctamente."
else
    echo "Error al restaurar la base de datos."
fi
