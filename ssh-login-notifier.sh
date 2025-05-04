#!/bin/bash

# Token del bot de Telegram y tu chat ID
BOT_TOKEN="<Introduce aquí el TOKEN de tu bot>"
CHAT_ID="<Introduce aquí el CHAT ID de tu cuenta donde deseas recibir alertas>"

# Verifica si es una sesión SSH y si las variables están configuradas
if [ -n "$SSH_CONNECTION" ] && [ -n "$BOT_TOKEN" ] && [ -n "$CHAT_ID" ]; then
    CLIENT_IP=$(echo "$SSH_CONNECTION" | cut -d ' ' -f 1)
    MESSAGE="🚨 Nuevo inicio de sesión en el servidor: $(whoami) desde IP: $CLIENT_IP"

# Enviar el mensaje
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
         -d chat_id="$CHAT_ID" \
         -d text="$MESSAGE" >/dev/null 2>&1

# Registrar el envío del mensaje en el log
        echo "$(date) - Mensaje enviado: $MESSAGE" >> /var/log/login_alert.log
fi
