USE SUCOS_VENDAS;

/* CRIANDO PROCEDURES */
CALL ola_mundo;

CALL mostra_numero;

CALL mostra_numero_alias;

CALL sp_com_funcoes;

CALL sp_com_comentarios;

CALL alo_mundo2;

/* ALTERANDO PROCEDURES */
USE `sucos_vendas`;
DROP procedure IF EXISTS `alo_mundo2`;

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`alo_mundo2`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alo_mundo3`()
BEGIN
SELECT 'Alô mundo!, tudo bem?, versão 3' as resultado;
END$$

DELIMITER ;
;

DROP procedure IF EXISTS `alo_mundo3`;

/* DECLARANDO VARIÁVEIS */
CALL exibe_variavel;

CALL tipos_de_dados;

CALL data_hora_local; 

/* Crie 4 variáveis com as características abaixo:
Nome: Cliente. 
Tipo: Caracteres com 10 posições. 
Valor: João
Nome: Idade. 
Tipo: Inteiro. 
Valor: 10
Nome: DataNascimento. 
Tipo: Data. 
Valor: 10/01/2007
Nome: Custo. 
Tipo: Número com casas decimais. 
Valor: 10,23 */
/* -------------------------- RESPOSTA -------------------------- 

CREATE PROCEDURE `sp_Exerc01` ()
BEGIN
DECLARE cliente varchar(10) default 'João';
DECLARE idade integer default 10;
DECLARE dataNascimento date default '2007-01-10';
DECLARE custo decimal default 10.23;
SELECT cliente;
SELECT idade;
SELECT dataNascimento;
SELECT custo;
END */

CALL sp_Exerc01;

/* MANIPULANDO DADOS COM STORED PROCEDURE */

INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
    ('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
    ('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
    ('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
    ('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
    ('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
    ('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
    ('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
    ('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
    ('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
    ('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
    ('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

call manipulacao_dados;

call inclui_novo_produto;

select * from tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'sabor do mar%';

/* Crie uma Stored procedure que atualize a idade dos clientes. */

/* CREATE DEFINER=`root`@`localhost` PROCEDURE `calcula_idade`()
BEGIN
UPDATE tabela_de_clientes set idade =  TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());
END */

call calcula_idade;
select * from tabela_de_clientes;

/* UTILIZANDO PARÂMETROS NA SP */

/* CREATE DEFINER=`root`@`localhost` PROCEDURE `inclui_produto_paramentro`(vcodigo varchar(50),
 vnome varchar(50),
 vsabor varchar(50),
 vtamanho varchar(50),
 vembalagem varchar(50),
 vpreco decimal(10,2)
 )
BEGIN

INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vcodigo,
    vnome,
    vsabor,
    vtamanho,
    vembalagem,
    vpreco);
END */

call inclui_produto_paramentro ('4000001', 'Sabor do Pantanal 1 Litro - Melancia', 'Melancia', '1 Litro', 'PET', 4.76);

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '4000001';

/* Crie uma Stored procedure para reajustar o % de comissão dos vendedores. Inclua como parâmetro da SP o %, expresso em valor (Ex: 0,90). */

select * from tabela_de_vendedores;

/* CREATE DEFINER=`root`@`localhost` PROCEDURE `reajuste_comissao`(percentual_comissao float)
BEGIN
UPDATE tabela_de_vendedores SET percentual_comissao = 0.09 WHERE YEAR(DATA_ADMISSAO) <= 2016;
UPDATE tabela_de_vendedores SET percentual_comissao = 0.12 WHERE YEAR(DATA_ADMISSAO) > 2016;
END */

CALL Reajuste_Comissao;
SELECT * FROM TABELA_DE_VENDEDORES;

/* UTILIZANDO CONTROLE DE ERROS */
call inclui_produto_paramentro ('4000002', 'Sabor do Pantanal 1 Litro - Melancia', 'Melancia', '1 Litro', 'PET', 4.76);

/* Crie uma variável chamada NUMNOTAS e atribua a ela o número de notas fiscais do dia 01/01/2017. Mostre na saída do script o valor da variável.  */

/* CREATE DEFINER=`root`@`localhost` PROCEDURE `Quantidade_Notas`()
BEGIN
DECLARE NUMNOTAS INT;
SELECT COUNT(*) INTO NUMNOTAS  FROM NOTAS_FISCAIS WHERE DATA_VENDA = '20170101';
SELECT NUMNOTAS;
END */

call Quantidade_Notas;

/* UTILIZANDO IF THEN ELSE */

SELECT * FROM tabela_de_clientes;

SELECT DATA_DE_NASCIMENTO FROM tabela_de_clientes
WHERE CPF = '1471156710';

/* CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente_idade`(vCPF varchar(20))
BEGIN
DECLARE vResultado varchar(20);
DECLARE vDataNascimento DATE;
SELECT DATA_DE_NASCIMENTO INTO vDataNascimento FROM tabela_de_clientes
WHERE CPF = vCPF;

IF vDataNascimento < '20000101' THEN
	SET vResultado = 'Cliente velho';
ELSE
	SET vResultado = 'Cliente novo';
END IF;
	SELECT vResultado;
END */

call cliente_idade ('19290992743');

/* Crie uma Stored Procedure que, baseado em uma data, contamos o número de notas fiscais. Se houverem mais que 70 notas exibimos a mensagem: ‘Muita nota’. 
Ou então exibimos a mensagem ‘Pouca nota’. Também exibir o número de notas. */

/* CREATE PROCEDURE `Testa_Numero_Notas` (vDataNota DATE)
BEGIN
	DECLARE numNotas int;
	SELECT count(*) INTO numNotas FROM NOTAS_FISCAIS
	WHERE DATA_VENDA = vDataNota;

	IF numNotas > 70 THEN
		SELECT 'Muitas notas', numNotas;
	ELSE
		SELECT 'Poucas notas', numNotas;
	END IF;
END */

SELECT * FROM NOTAS_FISCAIS;
CALL Testa_Numero_Notas('20150101');

-- >= 12,00 - CARO
-- >=7,00 - EM CONTA
-- <7 - BARATO

SELECT * FROM TABELA_DE_PRODUTOS;

SELECT PRECO_DE_LISTA FROM tabela_de_produtos
WHERE CODIGO_DO_PRODUTO = '1000889';

/* CREATE PROCEDURE `VerificaStatusPreco` (vProduto varchar(50))
BEGIN
	DECLARE vPreco FLOAT;
    DECLARE vMensagem varchar(30);
    
    SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
	WHERE CODIGO_DO_PRODUTO = vProduto;
    
    IF vpreco >= 12 THEN
		SET vMensagem = 'Produto caro';
	ELSEIF vPreco >= 7 AND vPreco <12 THEN
		SET vMensagem = 'Produto em conta';
	ELSE
		SET vMensagem = 'Produto barato';
	END IF;
    SELECT vMensagem;
END
*/

call VerificaStatusPreco ('1013793');

/* Construa uma Stored Procedure chamada Comparativo_Vendas que compara as vendas em duas datas (Estas duas datas serão parâmetros da SP). 
Se a variação percentual destas vendas for maior que 10% a resposta deve ser "Verde". Se for entre -10% e 10% deve retornar "Amarela". 
Se o retorno form menor que -10% deve retornar "Vermelho". */

SELECT ROUND(SUM(B.QUANTIDADE * B.PRECO)) AS TOTAL_VENDA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20170301';

CALL Comparativo_Vendas(20150101, 20170101);

-- UTILIZANDO CASE END CASE 

USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_tipo_sabor`;
DELIMITER $$

USE `sucos_vendas`$$
CREATE PROCEDURE `acha_tipo_sabor`(vProduto VARCHAR(50))
BEGIN
  DECLARE vSabor VARCHAR(50);
  SELECT SABOR INTO vSabor FROM tabela_de_Produtos
  WHERE codigo_do_produto = vProduto;
  CASE vSabor
  WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
  WHEN 'Laranja' THEN SELECT 'Cítrico';
  WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
  WHEN 'Uva' THEN SELECT 'Neutro';
  WHEN 'Morango' THEN SELECT 'Neutro';
  ELSE SELECT 'Ácidos';
  END CASE;
END$$
DELIMITER ;

/* Sabendo que a função abaixo soma de 1 dia uma data:

SELECT ADDDATE(DATA_VENDA, INTERVAL 1 DAY);

Faça uma Stored Procedure que, a partir do dia 01/01/2017, iremos contar o número de notas fiscais até o dia 10/01/2017. 
Devemos imprimir a data e o número de notas fiscais. Chame esta Stored Procedure de Soma_Dias_Notas. */

/* CREATE PROCEDURE `Soma_Dias_Notas`()
BEGIN
DECLARE DATAINICIAL DATE;
DECLARE DATAFINAL DATE;
DECLARE NUMNOTAS INT;
SET DATAINICIAL = '20170101';
SET DATAFINAL = '20170110';
WHILE DATAINICIAL <= DATAFINAL
DO
SELECT COUNT(*) INTO NUMNOTAS  FROM notas_fiscais WHERE DATA_VENDA = DATAINICIAL;
SELECT concat(DATE_FORMAT(DATAINICIAL, '%d/%m/%Y'), '-' , CAST(NUMNOTAS as CHAR(50)));
SELECT ADDDATE(DATAINICIAL, INTERVAL 1 DAY) INTO DATAINICIAL;
END WHILE;

END */

call Soma_Dias_Notas;

-- (ALEATÓRIO() * (MAX-MIN+1)) + MIN
-- MIN = 15, MAX = 300
SELECT RAND();

SELECT FLOOR((RAND() * (300-15+1)) + 15); -- FUNÇÃO FLOOR RETORNA APENAS A PARTE INTEIRA

-- CRIANDO FUNÇÃO

/*CREATE FUNCTION `f_numero_aleatorio` ()
RETURNS INTEGER
BEGIN
	DECLARE vRetorno INT;
    SELECT FLOOR((RAND() * (max-min+1)) + min) INTO vRetorno;
    RETURN vRetorno;
END */

SELECT f_numero_aleatorio(15,30);

CALL Tabela_Numeros