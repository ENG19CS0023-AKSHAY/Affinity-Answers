SELECT COUNT(*) AS num_tiger_types
FROM taxonomy
WHERE species LIKE '%panthera tigris%';
SELECT  ncbi_id FROM taxonomy WHERE species LIKE "%Panthera tigris sumatrae%";
SELECT column_name, COUNT(table_name) AS num_occurrences
FROM information_schema.columns
GROUP BY column_name
HAVING COUNT(table_name) > 1;
SELECT MAX(r.length) AS max_sequence_length FROM rfamseq AS r inner JOIN taxonomy AS t ON r.ncbi_id = t.ncbi_id WHERE t.species LIKE '%Oryza sativa%';
