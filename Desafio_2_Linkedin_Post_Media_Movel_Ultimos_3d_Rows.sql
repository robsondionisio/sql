/*
Desafio 2:
Suponha que você tenha uma tabela de vendas e queira calcular uma média móvel de vendas dos últimos 3 dias.
*/

/*
Resolvendo esse desafio explorando a clausula ROWS.

No exemplo abaixo, fazemos exatamente isso:
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW define um quadro de janela que inclui a linha atual e as duas linhas anteriores.
*/

SELECT
	nf.numero AS Num_NF,
    data_venda AS Data_Venda,
    ROUND((preco),2) AS Preco,
    ROUND(
			AVG (preco) OVER (
			ORDER BY data_venda
			ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
			), 2
		) AS Media_Movel_Ultimos_3_dias
FROM itens_notas_fiscais AS itensnf
LEFT JOIN notas_fiscais AS nf ON itensnf.numero = nf.numero;