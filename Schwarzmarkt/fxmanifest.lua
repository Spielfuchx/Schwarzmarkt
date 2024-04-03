fx_version 'adamant'
game 'gta5'

author 'SpielFuchx Scripts'
description 'Schwarzmarkt'
version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'config.lua',
	'server/server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'config.lua',
	'client/client.lua',
	'client/main.lua',
}