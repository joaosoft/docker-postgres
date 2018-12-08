#!/bin/bash

echo "Setting up server as slave..."

# Stop server
pg_ctl -D ${PGDATA} stop

# Setup .pgpass file
echo "$REPLICATE_FROM:5432:*:$POSTGRES_USER:$POSTGRES_PASSWORD" > $PGPASSFILE
chmod 0600 $PGPASSFILE

# Wait for master to be ready for connections
until pg_isready --dbname=$POSTGRES_DB --host=$REPLICATE_FROM --username=$POSTGRES_USER --timeout=2
do
    echo "Waiting for master to startup..."
    sleep 2s
done

# Backup current data
mv $PGDATA $PGDATA-backup

# Take initial backup from master
until pg_basebackup -h ${REPLICATE_FROM} -D ${PGDATA} -U ${POSTGRES_USER} -vP -w
do
    echo "Waiting for master to connect..."
    sleep 2s
done

# Enable replication
cat <<- EOF >> ${PGDATA}/postgresql.conf
hot_standby = on
EOF

cat <<- EOF >> ${PGDATA}/recovery.conf
standby_mode = on
primary_conninfo = 'host=${REPLICATE_FROM} port=5432 user=${POSTGRES_USER} password=${POSTGRES_PASSWORD}'
trigger_file = '/tmp/touch_me_to_promote_me_to_master'
EOF

# Start server
pg_ctl -D ${PGDATA} start