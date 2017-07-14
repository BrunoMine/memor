# MultiChat v2.0.0

## Descrição

Métodos estruturados para criação de um banco de dados simples


## Requisitos

* Minetest 0.4.16 ou superior

## Limitações

* Acesso ao banco de dados é lento
* O banco de dados não deve ser muito grande

## Licença LGPL v3.0
Memor é um software livre; você pode redistribuí-lo e/ou modificá-lo dentro dos termos da Licença Pública Geral Menor GNU como publicada pela Fundação do Software Livre (FSF); na versão 3 da Licença, ou (na sua opinião) qualquer versão. Este programa é distribuído na esperança de que possa ser útil, mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral Menor GNU para maiores detalhes. Você deve ter recebido uma cópia da Licença Pública Geral Menor GNU junto com este programa, se não, veja http://www.gnu.org/licenses/.

### Autores e contribuidores do código fonte

Originalmente por BrunoMine, Bruno Borges <borgesdossantosbruno@gmail.com>


## Como importar e usar

Você precisa apenas copiar o arquivo `memor.lua` para algum lugar de seu mod (por exemplo em um subdiretório `lib`)
Você pode montar of métodos em uma variavel global ou local, ambos irão funcionar exatamente da mesma forma.

### Pegando métodos
```lua
-- Pegando métodos do banco de dados
local bd = dofile(minetest.get_modpath("my_modname").."/lib/memor.lua")
```

### Métodos de operação
```txt
`salvar(itb, iv, v)` : Armazena um valor no banco de dados
`pegar(itb, iv)` : Pega o valor armazenado
`verif(itb, iv)` : Verifica se um valor existe
`remover(itb, iv)` : Remove um valor da tabela
`drop_tb(itb)` : Remove uma tabela
`listar(itb)` : Retorna uma tabela ordenada com os índices dos valores de uma tabela
	^ Se `itb` for nulo, retorna os índices das tabelas
```

Para todos os métodos explicados aqui:
* `itb` é uma string do índice da tabela no banco de dados
* `iv` é a string do índice do valor
* `v` é o valor no banco de dados (numerico, texto ou tabela)

### Exemplo de código
```lua
-- Montar um banco de dados na variavel 'registro'
local bd = dofile(minetest.get_modpath("my_modname").."/lib/memor.lua")

-- Criar uma tabela de "medalhas" onde "Maria" terá 15 e "Joao" terá 10
bd.salvar("medalhas", "Maria", 15)
bd.salvar("medalhas", "Joao", 10)

-- Verifica se "Maria" existe na tabela de "Medalhas"
if bd.verif("medalhas", "Maria") then

	-- Consulta quantas "medalhas" "Maria" tem
	local medalhas = bd.pegar("medalhas", "Maria") -- retorna 15

	minetest.chat_send_all("Maria tem " .. medalhas .. " medalhas")

end

-- Remover "Maria" da tabela "medalhas"
bd.remover("medalhas", "Maria")

-- Remove a tabela "medalhas"
bd.drop_tb("medalhas")
```


### Arquitetura de dados
Todo o banco de dados fica armazenada em `DiretórioDoMundo/ModName`
```txt
 mundo
    |-- modname
        |-- tabela1
        |   |-- valor1
        |   |-- valor2
        |-- tabela2
        |   |-- valor1
        |   |-- valor2
```

