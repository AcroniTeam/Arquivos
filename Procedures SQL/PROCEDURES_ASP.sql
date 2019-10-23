USE ACRONI_SQL

CREATE PROCEDURE usp_insertCliente 
	@nome VARCHAR(50),
	@usu VARCHAR(50),
	@senha VARCHAR(50),
	@email VARCHAR(50),
	@cpf VARCHAR(50)
AS
BEGIN
	INSERT INTO tblCliente (nome, usuario, senha, email, cpf) VALUES (@nome, @usu, @senha, @email, @cpf)
END
GO
CREATE PROCEDURE usp_updateImagemCliente
	@img VARBINARY(MAX),
	@usuario VARCHAR(100)
AS
BEGIN
	UPDATE tblCliente SET imagem_cliente = @img WHERE usuario = @usuario
END
GO
CREATE PROCEDURE usp_delete (
	@tabela NVARCHAR(255),
	@condicao NVARCHAR(255)
)
AS
BEGIN 
	DECLARE @query NVARCHAR(255) = 'DELETE FROM ' + @tabela + ' WHERE ' + @condicao
	EXEC sp_executesql @query
END
GO
CREATE PROCEDURE usp_retornaDs (
	@id1 INT,
	@id2 INT,
	@id3 INT,
	@aux VARCHAR(15)
)
AS
BEGIN
	IF @aux = 'loja1'
		SELECT TOP 3 * FROM tblProdutoDaLoja
	ELSE IF @aux = 'loja2'
		SELECT * FROM tblProdutoDaloja WHERE id_produto > 3
	ELSE IF @aux = 'carrinho'
		SELECT * FROM tblProdutoDaLoja WHERE id_produto in (@id1, @id2, @id3)
END
GO
CREATE PROCEDURE usp_segundoGaleria (
	@usuario VARCHAR(50)
)
AS
BEGIN
	SELECT imagem_colecao FROM tblColecao AS colec INNER JOIN tblCliente AS cli ON cli.id_cliente = colec.id_cliente AND usuario = @usuario
END
GO
CREATE PROCEDURE usp_GetImageTeclado (
	@usuario VARCHAR(50),
	@id_teclado_customizado int
)
AS
BEGIN
	SELECT imagem_teclado FROM tblTecladoCustomizado AS tec INNER JOIN tblCliente AS cli ON cli.id_cliente = tec.id_cliente AND usuario = @usuario AND id_teclado_customizado = @id_teclado_customizado
END
GO
CREATE PROCEDURE usp_GetImage (
	@usuario VARCHAR(50),
	@id_colecao int
)
AS
BEGIN
	SELECT imagem_colecao FROM tblColecao AS colec INNER JOIN tblCliente AS cli ON cli.id_cliente = colec.id_cliente AND usuario = @usuario AND id_colecao = @id_colecao
END
GO
CREATE PROCEDURE usp_select (
	@campos NVARCHAR(255),
	@tabela NVARCHAR(255),
	@condicao NVARCHAR(255)
)
AS
BEGIN 
	DECLARE @query NVARCHAR(255) = 'SELECT ' + @campos + ' FROM ' + @tabela + ' WHERE ' + @condicao
	EXEC sp_executesql @query
END
GO
CREATE PROCEDURE usp_update (
	@tabela NVARCHAR(255),
	@condicao NVARCHAR(255),
	@novaAtribuicao NVARCHAR(255)
)
AS
BEGIN
	DECLARE @query NVARCHAR(255) = 'UPDATE ' + @tabela + ' SET ' + @novaAtribuicao + ' WHERE ' + @condicao
	EXEC sp_executesql @query
END

