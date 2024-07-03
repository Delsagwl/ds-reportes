fx_version 'cerulean'

name "ds-reportes"
fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'Delsa'
description 'Sistema de reportes para Neon CM'
version '1.0.0'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
}

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}

ui_page 'html/index.html'