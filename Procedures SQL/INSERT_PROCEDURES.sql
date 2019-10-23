--PROCEUDRES DE INSERÇÃO
USE ACRONI_SQL
GO
CREATE PROCEDURE usp_insCadTblCliente
	@nome VARCHAR(50),
	@usuario VARCHAR(50),
	@senha VARCHAR(50),
	@email VARCHAR(50),
	@cpf VARCHAR(50)
AS
BEGIN
	INSERT INTO tblCliente(nome,usuario,senha,email,cpf) VALUES (@nome,@usuario,@senha,@email,@cpf)
END
GO
CREATE PROCEDURE usp_insTecladoCustomizado
	@id_cli INT,
	@imagem_teclado VARBINARY(MAX),
	@nickname_colecao VARCHAR(50),
	@nickname_teclado VARCHAR(50),
	@preco DECIMAL(6,2)
AS
BEGIN
	INSERT INTO tblTecladoCustomizado(id_colecao, id_cliente,imagem_teclado,nickname,preco) VALUES ((SELECT id_colecao FROM tblColecao WHERE nick_colecao LIKE @nickname_colecao AND id_cliente = @id_cli),@id_cli,@imagem_teclado,@nickname_teclado,@preco)
END
GO
CREATE PROCEDURE usp_insColecao
	@id_cliente INT,
	@nickname_colecao VARCHAR(50),
	@img VARBINARY(MAX)
AS
BEGIN
	INSERT INTO tblColecao(id_cliente, nick_colecao, imagem_colecao) VALUES (@id_cliente,@nickname_colecao, @img)
END
GO