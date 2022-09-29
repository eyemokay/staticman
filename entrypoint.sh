file_env() {
    local var="$1"
    local fileVar="${var}_FILE"
    local def="${2:-}"
    if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
	    mysql_error "Both $var and $fileVar are set (but are exclusive)"
    fi
    local val="$def"
    if [ "${!var:-}" ]; then
	    val="${!var}"
    elif [ "${!fileVar:-}" ]; then
	    val="$(< "${!fileVar}")"
    fi
    export "$var"="$val"
    unset "$fileVar"
}

docker_setup_env() {
    # Initialize values that might be stored in a file
    file_env 'RSA_PRIVATE_KEY'
    file_env 'GITLAB_TOKEN'
}

/usr/local/bin/npm start
