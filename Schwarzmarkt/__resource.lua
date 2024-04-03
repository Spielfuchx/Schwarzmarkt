resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'SpielFuchx Scripts'
description 'https://discord.gg/9fmax4PaFx'
version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
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
