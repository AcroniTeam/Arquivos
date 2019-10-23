
---Procedure: SELECT
USE ACRONI_SQL
GO
CREATE PROCEDURE usp_selUserInfo 
	@usuario VARCHAR(50)
AS
BEGIN
	SELECT senha, tipoConta, quantidade_teclados FROM tblCliente WHERE usuario=@usuario
END
GO
CREATE PROCEDURE usp_selMinhaContaInfo
	@userId INT
AS
BEGIN
	SELECT nome,cpf,cep,email,usuario,senha FROM tblCliente WHERE id_cliente = @userId
END
GO
CREATE PROCEDURE usp_selCadUserInfo
	@usuario VARCHAR(50),
	@email VARCHAR(50)
AS
BEGIN
	SELECT usuario, email FROM tblCliente WHERE usuario LIKE @usuario OR email LIKE @email
END
GO
CREATE PROCEDURE usp_selUserImage
	@usuario VARCHAR(50)
AS
BEGIN
	SELECT imagem_cliente FROM tblCliente WHERE usuario LIKE @usuario
END
GO
CREATE PROCEDURE usp_selNicknameTecladoCustomizado
	@id_cliente INT
AS
BEGIN
	SELECT nickname FROM tblTecladoCustomizado WHERE id_cliente = @id_cliente
END
GO
CREATE PROCEDURE usp_selIdColecao
	@nick_colecao VARCHAR(50),
	@id_cliente INT
AS
BEGIN
	select id_colecao from tblColecao where nick_colecao like @nick_colecao and id_cliente = @id_cliente
END
GO
CREATE PROCEDURE usp_selNickColecao
	@id_cliente INT
AS
BEGIN
	select nick_colecao from tblColecao where id_cliente = @id_cliente
END
GO
CREATE PROCEDURE usp_selTotalClientes
AS
BEGIN
	SELECT COUNT(id_cliente) FROM tblCliente
END
GO
CREATE PROCEDURE usp_selTotalTeclados
AS
BEGIN
	SELECT COUNT(id_teclado_customizado) FROM tblTecladoCustomizado
END
GO