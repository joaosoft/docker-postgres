#!/bin/bash

echo "Setting up server as master..."

# Create archive directory
mkdir -p $PGDATA/archive

# Give POSTGRES_USER replication permissions
cat <<- EOF >> ${PGDATA}/pg_hba.conf
host replication ${POSTGRES_USER} 0.0.0.0/0 md5
EOF

# Configure replication configuration
cat <<- EOF >> ${PGDATA}/postgresql.conf
wal_level = hot_standby
hot_standby = on
archive_mode = on
archive_command = 'test ! -f $PGDATA/archive/%f && cp %p $PGDATA/archive/%f'
max_wal_senders = $PG_MAX_WAL_SENDERS
wal_keep_segments = $PG_WAL_KEEP_SEGMENTS
EOF