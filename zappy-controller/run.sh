#!/usr/bin/with-contenv bashio

# Auto-detect MQTT config
MQTT_HOST="$(bashio::services 'mqtt' 'host')"
MQTT_PORT="$(bashio::services 'mqtt' 'port')"
MQTT_USER="$(bashio::services 'mqtt' 'username')"
MQTT_PASSWORD="$(bashio::services 'mqtt' 'password')"

export PATH=$PATH:/usr/local/go/bin

echo "writing config file"
cat << EOF > home.config
{
    "mqtt": {
        "broker": "$MQTT_HOST",
        "port": $MQTT_PORT,
        "user": "$MQTT_USER",
        "password": "$MQTT_PASSWORD",
        "clientId": "zappy-controller"
    }
}
EOF

# List possible USB serial ports
echo "available USB ports"
`go env GOPATH`/bin/zappy-controller scan


# Run the controller app
echo "starting controller"
`go env GOPATH`/bin/zappy-controller

echo "done"