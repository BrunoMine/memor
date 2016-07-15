--
-- Mod Memor
--
-- Operador de consultas
--

-- Diretório do Mundo
local wpath = minetest.get_worldpath()

-- Verifica diretorios e corrige
verificar = function(dir, subdir)
	
	-- Verifica e corrige diretorio
	local list = minetest.get_dir_list(minetest.get_worldpath(), true)
	local r = false
	for ndir, v in pairs(list) do
		if ndir == dir then
			r = true
			break
		end
	end
	-- Diretorio inexistente
	if r == false then
		memor.mkdir(dir)
	end
	
	-- Verifica e corrige subdiretorio
	list = minetest.get_dir_list(minetest.get_worldpath().."/"..dir, true)
	r = false
	for ndir, v in pairs(list) do
		if ndir == subdir then
			r = true
			break
		end
	end
	-- Subdiretorio inexistente
	if r == false then
		memor.mkdir(dir.."/"..subdir)
	end
	
end


-- Inserir dados
memor.inserir = function(mod, tb, index, valor)

	-- Tenta inserir direto
	if memor.escrever(mod, tb, index, valor) then return true end
	
	verificar(mod, tb)
	
	if memor.escrever(mod, tb, index, valor) then 
		return true 
	else
		minetest.log("error", "[Memor] Impossivel salvar dados (em memor.inserir)")
		return false
	end
	
end


-- Ler dados
memor.consultar = function(mod, tb, index)
	
	local r = memor.ler(mod, tb, index)
	if r then 
		return r
	else 
		minetest.log("error", "[Memor] Registro acessado inexistente ("..dump(mod).."/"..dump(tb).."/"..dump(index)..") (em memor.consultar)")
		return false
	end
	
end


-- Verificar dados
memor.verificar = function(dir, subdir, arquivo)
	local leitura = io.open(wpath .. "/" .. dir .. "/" .. subdir .. "/" .. arquivo, "w")
	if leitura then
		io.close(leitura)
		return true
	else 
		return false
	end
end



