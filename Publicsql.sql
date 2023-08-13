SELECT COUNT(*) AS num_tiger_types
FROM taxonomy
WHERE species LIKE '%panthera tigris%';
SELECT  ncbi_id FROM taxonomy WHERE species LIKE "%Panthera tigris sumatrae%";
SELECT column_name, COUNT(table_name) AS num_occurrences
FROM information_schema.columns
GROUP BY column_name
HAVING COUNT(table_name) > 1;
SELECT MAX(r.length) AS max_sequence_length FROM rfamseq AS r inner JOIN taxonomy AS t ON r.ncbi_id = t.ncbi_id WHERE t.species LIKE '%Oryza sativa%';
SELECT f.rfam_acc, t.species AS Family_name, MAX(r.length) AS longest_dna_sequence
FROM family AS f
JOIN full_region AS fr ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq AS r ON fr.rfamseq_acc = r.rfamseq_acc
JOIN taxonomy AS t ON r.ncbi_id = t.ncbi_id
GROUP BY f.rfam_acc, t.species
HAVING longest_dna_sequence > 1000000
ORDER BY longest_dna_sequence DESC
LIMIT 15 OFFSET 120;
