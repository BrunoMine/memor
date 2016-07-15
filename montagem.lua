--
-- Mod Memor
--
-- Montagem de banco de dados
--




-- Montar banco de dados em um mod
function memor.montar_bd(mod)
	v = {}
	v.mod = mod
	
	-- Inserir dados
	v.salvar = function(v, tb, index, valor)
		return memor.inserir(v.mod, tb, index, valor)
	end
	
	-- Consultar dados
	v.pegar = function(v, tb, index)
		return memor.consultar(v.mod, tb, index)
	end
	
	-- Verificar dados
	v.verif = function(v, tb, index)
		return memor.verificar(v.mod, tb, index)
	end
	
	-- Remover dados
	v.remover = function(v, tb, index)
		return memor.deletar(v.mod, tb, index)
	end
	
	-- Remover tabela
	v.drop_tb = function(v, tb)
		return memor.deletar_dir(v.mod, tb)
	end
	
	return v
end
