-- Etapa 1: Investigando quantidae de vendas por ano
SELECT
	EXTRACT(YEAR FROM DATA_VENDA) AS Ano,
    COUNT(*) AS Qtd_Vendas
FROM notas_fiscais
GROUP BY 1
ORDER BY 1 DESC;

-- Etapa 2: Incluindo a coluna 'Meses' com a quantidade de meses no ano
SELECT
    EXTRACT(YEAR FROM DATA_VENDA) AS Ano,
    COUNT(DISTINCT EXTRACT(MONTH FROM DATA_VENDA)) AS Meses_No_Ano,
    COUNT(*) AS Qtd_Vendas
FROM notas_fiscais
GROUP BY EXTRACT(YEAR FROM DATA_VENDA)
ORDER BY Ano DESC;

-- Exibindo Ano, Mês e Quantidade de Vendas
SELECT
	EXTRACT(YEAR FROM DATA_VENDA) AS Ano,
    EXTRACT(MONTH FROM DATA_VENDA) AS Mes,
    COUNT(*) AS Qtd_Vendas
FROM notas_fiscais
GROUP BY 1,2
ORDER BY 1 DESC, 2 DESC;

/*
Conclusão:
Etapa 1:
As vendas de 2018 pareciam baixas comparadas aos anos subsequentes.
Etapa 2 e 3:
Após uma investigação mais aprofundada, nas etapas 2 e 3 identifiquei que apenas os dados dos primeiros três meses foram registrados para esse ano (2018).
*/