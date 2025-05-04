# 🔐 SSH Login Alert via Telegram Bot

Este script envía una alerta a tu cuenta de Telegram cada vez que alguien inicia sesión por SSH en tu servidor. Es ideal para monitorear accesos no autorizados o simplemente estar al tanto de quién entra a tu sistema.

## 📦 Requisitos

- Servidor Linux con acceso root
- `curl` instalado
- Cuenta de Telegram
- Bot de Telegram creado con [@BotFather](https://t.me/BotFather)

## 🚀 Instalación

1. **Clona el repositorio**:
   ```bash
   git clone https://github.com/tu_usuario/ssh-login-alert-telegram.git
   cd ssh-login-alert-telegram
   
2. **Edita el script con tu BOT_TOKEN y CHAT_ID**:
  nano login_alert.sh

3. **Dale permisos de ejecución**:
   chmod +x login_alert.sh
   
4. **Ubica el script en el archivo SSHRC del sistema**:
   Copia el contenido del script dentro de /etc/ssh/sshrc o enlázalo con:
   sudo cp login_alert.sh /etc/ssh/sshrc
   sudo chmod +x /etc/ssh/sshrc
   
6. **Crea el archivo de log si no existe**:
   sudo touch /var/log/login_alert.log
   sudo chmod 644 /var/log/login_alert.log

# 🛠️ Cómo obtener tu BOT_TOKEN y CHAT_ID
1. **Crear un bot con @BotFather**
  Habla con @BotFather
  Envía /newbot y sigue los pasos
  Guarda el TOKEN que te da

2. **Obtener tu CHAT_ID**
Habla con tu bot (envía cualquier mensaje)
Luego ve a:
https://api.telegram.org/bot<BOT_TOKEN>/getUpdates
Busca tu id en "chat":{"id":XXXXXXXX}

## 📬 Prueba manual del script
Para probarlo sin conectarte por SSH:

SSH_CONNECTION="192.168.1.100 22 192.168.1.10 22" ./login_alert.sh

## 🔐 Seguridad
No publiques tu BOT_TOKEN ni CHAT_ID en GitHub. Usa variables de entorno o un archivo .env si vas a subirlo públicamente.

## 🧾 Licencia
MIT.
