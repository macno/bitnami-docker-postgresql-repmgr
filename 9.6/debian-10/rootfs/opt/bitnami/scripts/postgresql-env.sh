#!/bin/bash
#
# Environment configuration for postgresql

# The values for all environment variables will be set in the below order of precedence
# 1. Custom environment variables defined below after Bitnami defaults
# 2. Constants defined in this file (environment variables with no default), i.e. BITNAMI_ROOT_DIR
# 3. Environment variables overridden via external files using *_FILE variables (see below)
# 4. Environment variables set externally (i.e. current Bash context/Dockerfile/userdata)

export BITNAMI_ROOT_DIR="/opt/bitnami"
export BITNAMI_VOLUME_DIR="/bitnami"

# Logging configuration
export MODULE="${MODULE:-postgresql}"
export BITNAMI_DEBUG="${BITNAMI_DEBUG:-false}"

# By setting an environment variable matching *_FILE to a file path, the prefixed environment
# variable will be overridden with the value specified in that file
postgresql_env_vars=(
    POSTGRESQL_DATA_DIR
    POSTGRESQL_INIT_MAX_TIMEOUT
    POSTGRESQL_CLUSTER_APP_NAME
    POSTGRESQL_DATABASE
    POSTGRESQL_INITDB_ARGS
    ALLOW_EMPTY_PASSWORD
    POSTGRESQL_INITDB_WAL_DIR
    POSTGRESQL_MASTER_HOST
    POSTGRESQL_MASTER_PORT_NUMBER
    POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS
    POSTGRESQL_PORT_NUMBER
    POSTGRESQL_ALLOW_REMOTE_CONNECTIONS
    POSTGRESQL_REPLICATION_MODE
    POSTGRESQL_REPLICATION_USER
    POSTGRESQL_SYNCHRONOUS_COMMIT_MODE
    POSTGRESQL_FSYNC
    POSTGRESQL_USERNAME
    POSTGRESQL_ENABLE_LDAP
    POSTGRESQL_LDAP_URL
    POSTGRESQL_LDAP_PREFIX
    POSTGRESQL_LDAP_SUFFIX
    POSTGRESQL_LDAP_SERVER
    POSTGRESQL_LDAP_PORT
    POSTGRESQL_LDAP_SCHEME
    POSTGRESQL_LDAP_TLS
    POSTGRESQL_LDAP_BASE_DN
    POSTGRESQL_LDAP_BIND_DN
    POSTGRESQL_LDAP_BIND_PASSWORD
    POSTGRESQL_LDAP_SEARCH_ATTR
    POSTGRESQL_LDAP_SEARCH_FILTER
    POSTGRESQL_INITSCRIPTS_USERNAME
    POSTGRESQL_PASSWORD
    POSTGRESQL_POSTGRES_PASSWORD
    POSTGRESQL_REPLICATION_PASSWORD
    POSTGRESQL_INITSCRIPTS_PASSWORD
    POSTGRESQL_ENABLE_TLS
    POSTGRESQL_TLS_CERT_FILE
    POSTGRESQL_TLS_KEY_FILE
    POSTGRESQL_TLS_CA_FILE
    POSTGRESQL_TLS_CRL_FILE
    POSTGRESQL_TLS_PREFER_SERVER_CIPHERS
    REPMGR_DATA_DIR
    REPMGR_NODE_ID
    REPMGR_NODE_NAME
    REPMGR_NODE_NETWORK_NAME
    REPMGR_NODE_PRIORITY
    REPMGR_PORT_NUMBER
    REPMGR_LOG_LEVEL
    REPMGR_START_OPTIONS
    REPMGR_CONNECT_TIMEOUT
    REPMGR_RECONNECT_ATTEMPTS
    REPMGR_RECONNECT_INTERVAL
    REPMGR_PARTNER_NODES
    REPMGR_PRIMARY_HOST
    REPMGR_PRIMARY_PORT
    REPMGR_USE_REPLICATION_SLOTS
    REPMGR_MASTER_RESPONSE_TIMEOUT
    REPMGR_DEGRADED_MONITORING_TIMEOUT
    REPMGR_UPGRADE_EXTENSION
    REPMGR_SWITCH_ROLE
    REPMGR_USERNAME
    REPMGR_DATABASE
    REPMGR_PGHBA_TRUST_ALL
    REPMGR_PASSWORD
    PGCONNECT_TIMEOUT

)
for env_var in "${postgresql_env_vars[@]}"; do
    file_env_var="${env_var}_FILE"
    if [[ -n "${!file_env_var:-}" ]]; then
        export "${env_var}=$(< "${!file_env_var}")"
        unset "${file_env_var}"
    fi
done
unset postgresql_env_vars

# Paths
export PATH="/opt/bitnami/postgresql/bin:/opt/bitnami/common/bin:$PATH"
export POSTGRESQL_VOLUME_DIR="/bitnami/postgresql"
export POSTGRESQL_BASE_DIR="/opt/bitnami/postgresql"

export POSTGRESQL_DATA_DIR="${POSTGRESQL_DATA_DIR:-"${POSTGRES_DATA_DIR:-}"}"
export POSTGRESQL_DATA_DIR="${POSTGRESQL_DATA_DIR:-"${PGDATA:-}"}"
export POSTGRESQL_DATA_DIR="${POSTGRESQL_DATA_DIR:-${POSTGRESQL_VOLUME_DIR}/data}"
export POSTGRESQL_CONF_DIR="$POSTGRESQL_BASE_DIR/conf"
export POSTGRESQL_MOUNTED_CONF_DIR="$POSTGRESQL_VOLUME_DIR/conf"
export POSTGRESQL_CONF_FILE="$POSTGRESQL_CONF_DIR/postgresql.conf"
export POSTGRESQL_PGHBA_FILE="$POSTGRESQL_CONF_DIR/pg_hba.conf"
export POSTGRESQL_RECOVERY_FILE="$POSTGRESQL_DATA_DIR/recovery.conf"
export POSTGRESQL_LOG_DIR="$POSTGRESQL_BASE_DIR/logs"
export POSTGRESQL_LOG_FILE="$POSTGRESQL_LOG_DIR/postgresql.log"
export POSTGRESQL_TMP_DIR="$POSTGRESQL_BASE_DIR/tmp"
export POSTGRESQL_PID_FILE="$POSTGRESQL_TMP_DIR/postgresql.pid"
export POSTGRESQL_BIN_DIR="$POSTGRESQL_BASE_DIR/bin"
export POSTGRESQL_INITSCRIPTS_DIR="/docker-entrypoint-initdb.d"
export POSTGRESQL_PREINITSCRIPTS_DIR="/docker-entrypoint-preinitdb.d"
export PATH="${POSTGRESQL_BIN_DIR}:${BITNAMI_ROOT_DIR}/common/bin:${PATH}"

# System users (when running with a privileged user)
export POSTGRESQL_DAEMON_USER="postgres"
export POSTGRESQL_DAEMON_GROUP="postgres"

# PostgreSQL settings
export POSTGRESQL_INIT_MAX_TIMEOUT="${POSTGRESQL_INIT_MAX_TIMEOUT:-60}"

export POSTGRESQL_CLUSTER_APP_NAME="${POSTGRESQL_CLUSTER_APP_NAME:-"${POSTGRES_CLUSTER_APP_NAME:-}"}"
export POSTGRESQL_CLUSTER_APP_NAME="${POSTGRESQL_CLUSTER_APP_NAME:-walreceiver}"

export POSTGRESQL_DATABASE="${POSTGRESQL_DATABASE:-"${POSTGRES_DATABASE:-}"}"
export POSTGRESQL_DATABASE="${POSTGRESQL_DATABASE:-"${POSTGRES_DB:-}"}"
export POSTGRESQL_DATABASE="${POSTGRESQL_DATABASE:-postgres}"

export POSTGRESQL_INITDB_ARGS="${POSTGRESQL_INITDB_ARGS:-"${POSTGRES_INITDB_ARGS:-}"}"
export POSTGRESQL_INITDB_ARGS="${POSTGRESQL_INITDB_ARGS:-}"
export ALLOW_EMPTY_PASSWORD="${ALLOW_EMPTY_PASSWORD:-no}"

export POSTGRESQL_INITDB_WAL_DIR="${POSTGRESQL_INITDB_WAL_DIR:-"${POSTGRES_INITDB_WAL_DIR:-}"}"
export POSTGRESQL_INITDB_WAL_DIR="${POSTGRESQL_INITDB_WAL_DIR:-}"

export POSTGRESQL_MASTER_HOST="${POSTGRESQL_MASTER_HOST:-"${POSTGRES_MASTER_HOST:-}"}"
export POSTGRESQL_MASTER_HOST="${POSTGRESQL_MASTER_HOST:-}"

export POSTGRESQL_MASTER_PORT_NUMBER="${POSTGRESQL_MASTER_PORT_NUMBER:-"${POSTGRES_MASTER_PORT_NUMBER:-}"}"
export POSTGRESQL_MASTER_PORT_NUMBER="${POSTGRESQL_MASTER_PORT_NUMBER:-5432}"

export POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS="${POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS:-"${POSTGRES_NUM_SYNCHRONOUS_REPLICAS:-}"}"
export POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS="${POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS:-0}"

export POSTGRESQL_PORT_NUMBER="${POSTGRESQL_PORT_NUMBER:-"${POSTGRES_PORT_NUMBER:-}"}"
export POSTGRESQL_PORT_NUMBER="${POSTGRESQL_PORT_NUMBER:-5432}"

export POSTGRESQL_ALLOW_REMOTE_CONNECTIONS="${POSTGRESQL_ALLOW_REMOTE_CONNECTIONS:-"${POSTGRES_ALLOW_REMOTE_CONNECTIONS:-}"}"
export POSTGRESQL_ALLOW_REMOTE_CONNECTIONS="${POSTGRESQL_ALLOW_REMOTE_CONNECTIONS:-yes}"

export POSTGRESQL_REPLICATION_MODE="${POSTGRESQL_REPLICATION_MODE:-"${POSTGRES_REPLICATION_MODE:-}"}"
export POSTGRESQL_REPLICATION_MODE="${POSTGRESQL_REPLICATION_MODE:-master}"

export POSTGRESQL_REPLICATION_USER="${POSTGRESQL_REPLICATION_USER:-"${POSTGRES_REPLICATION_USER:-}"}"
export POSTGRESQL_REPLICATION_USER="${POSTGRESQL_REPLICATION_USER:-}"

export POSTGRESQL_SYNCHRONOUS_COMMIT_MODE="${POSTGRESQL_SYNCHRONOUS_COMMIT_MODE:-"${POSTGRES_SYNCHRONOUS_COMMIT_MODE:-}"}"
export POSTGRESQL_SYNCHRONOUS_COMMIT_MODE="${POSTGRESQL_SYNCHRONOUS_COMMIT_MODE:-on}"

export POSTGRESQL_FSYNC="${POSTGRESQL_FSYNC:-"${POSTGRES_FSYNC:-}"}"
export POSTGRESQL_FSYNC="${POSTGRESQL_FSYNC:-on}"

export POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-"${POSTGRES_USERNAME:-}"}"
export POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-"${POSTGRES_USER:-}"}"
export POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-"${POSTGRESQL_USER:-}"}"
export POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-postgres}"

export POSTGRESQL_ENABLE_LDAP="${POSTGRESQL_ENABLE_LDAP:-"${POSTGRES_ENABLE_LDAP:-}"}"
export POSTGRESQL_ENABLE_LDAP="${POSTGRESQL_ENABLE_LDAP:-no}"

export POSTGRESQL_LDAP_URL="${POSTGRESQL_LDAP_URL:-"${POSTGRES_LDAP_URL:-}"}"
export POSTGRESQL_LDAP_URL="${POSTGRESQL_LDAP_URL:-}"

export POSTGRESQL_LDAP_PREFIX="${POSTGRESQL_LDAP_PREFIX:-"${POSTGRES_LDAP_PREFIX:-}"}"
export POSTGRESQL_LDAP_PREFIX="${POSTGRESQL_LDAP_PREFIX:-}"

export POSTGRESQL_LDAP_SUFFIX="${POSTGRESQL_LDAP_SUFFIX:-"${POSTGRES_LDAP_SUFFIX:-}"}"
export POSTGRESQL_LDAP_SUFFIX="${POSTGRESQL_LDAP_SUFFIX:-}"

export POSTGRESQL_LDAP_SERVER="${POSTGRESQL_LDAP_SERVER:-"${POSTGRES_LDAP_SERVER:-}"}"
export POSTGRESQL_LDAP_SERVER="${POSTGRESQL_LDAP_SERVER:-}"

export POSTGRESQL_LDAP_PORT="${POSTGRESQL_LDAP_PORT:-"${POSTGRES_LDAP_PORT:-}"}"
export POSTGRESQL_LDAP_PORT="${POSTGRESQL_LDAP_PORT:-}"

export POSTGRESQL_LDAP_SCHEME="${POSTGRESQL_LDAP_SCHEME:-"${POSTGRES_LDAP_SCHEME:-}"}"
export POSTGRESQL_LDAP_SCHEME="${POSTGRESQL_LDAP_SCHEME:-}"

export POSTGRESQL_LDAP_TLS="${POSTGRESQL_LDAP_TLS:-"${POSTGRES_LDAP_TLS:-}"}"
export POSTGRESQL_LDAP_TLS="${POSTGRESQL_LDAP_TLS:-}"

export POSTGRESQL_LDAP_BASE_DN="${POSTGRESQL_LDAP_BASE_DN:-"${POSTGRES_LDAP_BASE_DN:-}"}"
export POSTGRESQL_LDAP_BASE_DN="${POSTGRESQL_LDAP_BASE_DN:-}"

export POSTGRESQL_LDAP_BIND_DN="${POSTGRESQL_LDAP_BIND_DN:-"${POSTGRES_LDAP_BIND_DN:-}"}"
export POSTGRESQL_LDAP_BIND_DN="${POSTGRESQL_LDAP_BIND_DN:-}"

export POSTGRESQL_LDAP_BIND_PASSWORD="${POSTGRESQL_LDAP_BIND_PASSWORD:-"${POSTGRES_LDAP_BIND_PASSWORD:-}"}"
export POSTGRESQL_LDAP_BIND_PASSWORD="${POSTGRESQL_LDAP_BIND_PASSWORD:-}"

export POSTGRESQL_LDAP_SEARCH_ATTR="${POSTGRESQL_LDAP_SEARCH_ATTR:-"${POSTGRES_LDAP_SEARCH_ATTR:-}"}"
export POSTGRESQL_LDAP_SEARCH_ATTR="${POSTGRESQL_LDAP_SEARCH_ATTR:-}"

export POSTGRESQL_LDAP_SEARCH_FILTER="${POSTGRESQL_LDAP_SEARCH_FILTER:-"${POSTGRES_LDAP_SEARCH_FILTER:-}"}"
export POSTGRESQL_LDAP_SEARCH_FILTER="${POSTGRESQL_LDAP_SEARCH_FILTER:-}"

export POSTGRESQL_INITSCRIPTS_USERNAME="${POSTGRESQL_INITSCRIPTS_USERNAME:-"${POSTGRES_INITSCRIPTS_USERNAME:-}"}"
export POSTGRESQL_INITSCRIPTS_USERNAME="${POSTGRESQL_INITSCRIPTS_USERNAME:-$POSTGRESQL_USERNAME}"

export POSTGRESQL_PASSWORD="${POSTGRESQL_PASSWORD:-"${POSTGRES_PASSWORD:-}"}"
export POSTGRESQL_PASSWORD="${POSTGRESQL_PASSWORD:-}"

export POSTGRESQL_POSTGRES_PASSWORD="${POSTGRESQL_POSTGRES_PASSWORD:-"${POSTGRES_POSTGRES_PASSWORD:-}"}"
export POSTGRESQL_POSTGRES_PASSWORD="${POSTGRESQL_POSTGRES_PASSWORD:-}"

export POSTGRESQL_REPLICATION_PASSWORD="${POSTGRESQL_REPLICATION_PASSWORD:-"${POSTGRES_REPLICATION_PASSWORD:-}"}"
export POSTGRESQL_REPLICATION_PASSWORD="${POSTGRESQL_REPLICATION_PASSWORD:-}"

export POSTGRESQL_INITSCRIPTS_PASSWORD="${POSTGRESQL_INITSCRIPTS_PASSWORD:-"${POSTGRES_INITSCRIPTS_PASSWORD:-}"}"
export POSTGRESQL_INITSCRIPTS_PASSWORD="${POSTGRESQL_INITSCRIPTS_PASSWORD:-$POSTGRESQL_PASSWORD}"

export POSTGRESQL_ENABLE_TLS="${POSTGRESQL_ENABLE_TLS:-"${POSTGRES_ENABLE_TLS:-}"}"
export POSTGRESQL_ENABLE_TLS="${POSTGRESQL_ENABLE_TLS:-no}"

export POSTGRESQL_TLS_CERT_FILE="${POSTGRESQL_TLS_CERT_FILE:-"${POSTGRES_TLS_CERT_FILE:-}"}"
export POSTGRESQL_TLS_CERT_FILE="${POSTGRESQL_TLS_CERT_FILE:-}"

export POSTGRESQL_TLS_KEY_FILE="${POSTGRESQL_TLS_KEY_FILE:-"${POSTGRES_TLS_KEY_FILE:-}"}"
export POSTGRESQL_TLS_KEY_FILE="${POSTGRESQL_TLS_KEY_FILE:-}"

export POSTGRESQL_TLS_CA_FILE="${POSTGRESQL_TLS_CA_FILE:-"${POSTGRES_TLS_CA_FILE:-}"}"
export POSTGRESQL_TLS_CA_FILE="${POSTGRESQL_TLS_CA_FILE:-}"

export POSTGRESQL_TLS_CRL_FILE="${POSTGRESQL_TLS_CRL_FILE:-"${POSTGRES_TLS_CRL_FILE:-}"}"
export POSTGRESQL_TLS_CRL_FILE="${POSTGRESQL_TLS_CRL_FILE:-}"

export POSTGRESQL_TLS_PREFER_SERVER_CIPHERS="${POSTGRESQL_TLS_PREFER_SERVER_CIPHERS:-"${POSTGRES_TLS_PREFER_SERVER_CIPHERS:-}"}"
export POSTGRESQL_TLS_PREFER_SERVER_CIPHERS="${POSTGRESQL_TLS_PREFER_SERVER_CIPHERS:-yes}"

# Internal
export POSTGRESQL_FIRST_BOOT="yes"
export NSS_WRAPPER_LIB="/opt/bitnami/common/lib/libnss_wrapper.so"

# Paths (Replication Manager)
export PATH="/opt/bitnami/repmgr/bin:/opt/bitnami/common/bin:$PATH"
export REPMGR_BASE_DIR="/opt/bitnami/repmgr"
export REPMGR_CONF_DIR="$REPMGR_BASE_DIR/conf"
export REPMGR_VOLUME_DIR="/bitnami/repmgr"
export REPMGR_MOUNTED_CONF_DIR="$REPMGR_VOLUME_DIR/conf"
export REPMGR_TMP_DIR="$REPMGR_BASE_DIR/tmp"
export REPMGR_EVENTS_DIR="$REPMGR_BASE_DIR/events"
export REPMGR_PRIMARY_ROLE_LOCK_FILE_NAME="$REPMGR_TMP_DIR/master.lock"
export REPMGR_STANDBY_ROLE_LOCK_FILE_NAME="$REPMGR_TMP_DIR/standby.lock"
export REPMGR_BIN_DIR="$REPMGR_BASE_DIR/bin"
export REPMGR_CONF_FILE="$REPMGR_CONF_DIR/repmgr.conf"
export REPMGR_PID_FILE="$REPMGR_TMP_DIR/repmgr.pid"
export REPMGR_DATA_DIR="${REPMGR_DATA_DIR:-${REPMGR_VOLUME_DIR}/repmgr/data}"

# Settings (Replication Manager)
export REPMGR_NODE_ID="${REPMGR_NODE_ID:-}"
export REPMGR_NODE_NAME="${REPMGR_NODE_NAME:-$(hostname)}"
export REPMGR_NODE_NETWORK_NAME="${REPMGR_NODE_NETWORK_NAME:-}"
export REPMGR_NODE_PRIORITY="${REPMGR_NODE_PRIORITY:-100}"
export REPMGR_PORT_NUMBER="${REPMGR_PORT_NUMBER:-5432}"
export REPMGR_LOG_LEVEL="${REPMGR_LOG_LEVEL:-NOTICE}"
export REPMGR_START_OPTIONS="${REPMGR_START_OPTIONS:-}"
export REPMGR_CONNECT_TIMEOUT="${REPMGR_CONNECT_TIMEOUT:-5}"
export REPMGR_RECONNECT_ATTEMPTS="${REPMGR_RECONNECT_ATTEMPTS:-3}"
export REPMGR_RECONNECT_INTERVAL="${REPMGR_RECONNECT_INTERVAL:-5}"
export REPMGR_PARTNER_NODES="${REPMGR_PARTNER_NODES:-}"
export REPMGR_PRIMARY_HOST="${REPMGR_PRIMARY_HOST:-}"
export REPMGR_PRIMARY_PORT="${REPMGR_PRIMARY_PORT:-5432}"
export REPMGR_USE_REPLICATION_SLOTS="${REPMGR_USE_REPLICATION_SLOTS:-1}"
export REPMGR_MASTER_RESPONSE_TIMEOUT="${REPMGR_MASTER_RESPONSE_TIMEOUT:-20}"
export REPMGR_DEGRADED_MONITORING_TIMEOUT="${REPMGR_DEGRADED_MONITORING_TIMEOUT:-5}"
export REPMGR_UPGRADE_EXTENSION="${REPMGR_UPGRADE_EXTENSION:-no}"

# Internal (Replication Manager)
export REPMGR_SWITCH_ROLE="${REPMGR_SWITCH_ROLE:-no}"
export REPMGR_CURRENT_PRIMARY_HOST=""
export REPMGR_CURRENT_PRIMARY_PORT="$REPMGR_PRIMARY_PORT"

# Credentials (Replication Manager)
export REPMGR_USERNAME="${REPMGR_USERNAME:-repmgr}"
export REPMGR_DATABASE="${REPMGR_DATABASE:-repmgr}"
export REPMGR_PGHBA_TRUST_ALL="${REPMGR_PGHBA_TRUST_ALL:-no}"
export REPMGR_PASSWORD="${REPMGR_PASSWORD:-}"

# PostgreSQL env var (Replication Manager)
export PGCONNECT_TIMEOUT="${PGCONNECT_TIMEOUT:-10}"
export POSTGRESQL_REPLICATION_USER="$REPMGR_USERNAME"
export POSTGRESQL_REPLICATION_PASSWORD="$REPMGR_PASSWORD"
export POSTGRESQL_MASTER_HOST="$REPMGR_PRIMARY_HOST"
export POSTGRESQL_MASTER_PORT_NUMBER="$REPMGR_PRIMARY_PORT"

# Custom environment variables may be defined below
