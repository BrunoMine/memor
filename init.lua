--
-- Mod Memor
--
-- Inicializador de scripts Lua
--

-- Notificador de Inicializador
local notificar = function(msg)
	if minetest.setting_get("log_mods") then
		minetest.debug("[MEMOR]"..msg)
	end
end

local modpath = minetest.get_modpath("memor")

-- Variavel global
memor = {}

-- Carregar scripts
notificar("Carregando scripts...")
dofile(modpath.."/arquivo.lua")
dofile(modpath.."/consulta.lua")
dofile(modpath.."/montagem.lua")
notificar("OK")

