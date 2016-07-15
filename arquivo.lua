--
-- Mod Memor
--
-- Operador de arquivamentos e leituras
--

-- Diretorio do mundo
local wpath = minetest.get_worldpath()

-- Cria um diretório na pasta do mundo
function memor.mkdir(dir, sub)
	if not dir then
		minetest.log("error", "[Memor] Nenhum diretorio especificado (em memor.mkdir)")
		return false
	end
	
	dir = wpath.."/"..dir
	
	if minetest.mkdir then
		minetest.mkdir(dir)
	else
		os.execute('mkdir "' .. dir .. '"')
	end
	return true
end

-- Criar um arquivo com os dados serializados (Salvar)
function memor.escrever(mod, dir, arquivo, dados)
	if not mod or not dir or not arquivo or not dados then 
		minetest.log("error", "[Memor] Faltou dados (em memor.escrever)")
		return false 
	end
	
	local saida = io.open(wpath .. "/" .. mod .. "/" .. dir .. "/" .. arquivo, "w")
	if saida then
		saida:write(minetest.serialize(dados))
		io.close(saida)
		return true
	else
		minetest.log("info", "[Memor] memor.escrever tentou escrever num diretorio inexistente")
		return false
	end
end

-- Ler dados de um arquivo de memória (Carregar)
function memor.ler(mod, dir, arquivo)
	if not mod or not dir or not arquivo then 
		minetest.log("error", "[Memor] Faltou dados (em memor.ler)")
		return false 
	end
	
	local entrada = io.open(wpath .. "/" .. mod .. "/" .. dir .. "/" .. arquivo, "r")
	if entrada then
		local dados = minetest.deserialize(entrada:read("*l"))
		io.close(entrada)
		return dados
	else
		minetest.log("error", "[Memor] pasta e/ou arquivo inexiste(s) (em memor.ler)")
		return false
	end
end
