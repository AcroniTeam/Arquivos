--PROCEDURES DE DELEÇÃO
USE ACRONI_SQL
GO
CREATE PROCEDURE usp_delTecladoCustomizado
	@id INT
AS
BEGIN
	DELETE FROM tblTecladoCustomizado WHERE id_cliente = @id
END
GO
CREATE PROCEDURE usp_delTecladoCustomizadoFromName
	@id_cliente INT,
	@nickname VARCHAR(50)
AS
BEGIN
	DELETE FROM tblTecladoCustomizado WHERE id_cliente = @id_cliente AND nickname = @nickname
END
GO
CREATE PROCEDURE usp_delColecao
	@id_cliente INT,
	@nick_colecao VARCHAR(50)
AS
BEGIN
	DELETE FROM tblColecao WHERE nick_colecao = @nick_colecao AND id_cliente = @id_cliente
END
GO