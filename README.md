# Sistema de Reportes de FiveM

Este es un sistema de reportes para servidores de FiveM basado en QBCore que permite a los jugadores enviar reportes a través de un comando y adjuntar capturas de pantalla. 
Los reportes se envían a un webhook de Discord configurado.

## Características

- Envío de reportes mediante un comando en el juego.
- Captura y adjunta una captura de pantalla al reporte.
- Envío de los reportes a un webhook de Discord.
- Incluye información del jugador y su licencia.

## Requisitos

- [FiveM](https://fivem.net/)
- [QBCore Framework](https://github.com/qbcore-framework/qb-core)
- [screenshot-basic](https://forum.cfx.re/t/release-screenshot-basic/1982894)

## Instalación

1. **Descargar y Extraer**:
   - Descarga este recurso y extrae los archivos en la carpeta `resources` de tu servidor de FiveM.

2. **Configurar `screenshot-basic`**:
   - Instala el recurso `screenshot-basic` siguiendo las instrucciones del [hilo oficial](https://forum.cfx.re/t/release-screenshot-basic/1982894).

3. **Configurar el repositorio**:
   - Abre el archivo `client/main.lua` y encuentra la siguiente línea:
     ```lua
     exports['screenshot-basic']:requestScreenshotUpload('CONFIGURA URL del repositorio', 'image', function(data)
     ```
   - Reemplaza `CONFIGURA URL del repositorio` con tu URL del repositorio o webhook de Discord.

4. **Configurar el Webhook de Discord**:
   - Abre el archivo `server/main.lua` y encuentra la siguiente línea:
     ```lua
     local discordWebhookURL = 'https://discord.com/api/webhooks/xxxxxxxx/xxxxxxxx'
     ```
   - Reemplaza `'https://discord.com/api/webhooks/xxxxxxxx/xxxxxxxx'` con tu URL del webhook de Discord.

5. **Agregar el recurso a tu `server.cfg`**:
   - Abre tu archivo `server.cfg` y añade la siguiente línea para asegurar que el recurso se inicie con tu servidor:
     ```plaintext
     ensure ds-reportes
     ensure screenshot-basic
     ```

## Captura de Pantalla

![Captura de Pantalla](https://i.gyazo.com/f48ea7c9a3b2354a3c10265bd4682985.png)

## Uso

- Los jugadores pueden enviar un reporte utilizando el comando `/reporte` en el chat del juego.
- La interfaz de usuario se abrirá para que el jugador ingrese los detalles del reporte y capture una pantalla.
- El reporte, junto con la captura de pantalla y la información del jugador, se enviará al webhook de Discord configurado.