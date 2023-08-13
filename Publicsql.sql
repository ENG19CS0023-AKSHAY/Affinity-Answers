-- 1) How many types of tigers can be found in the taxonomy table of the dataset? What is the "ncbi_id" of the Sumatran Tiger? (hint: use the biological name of the tiger)
SELECT COUNT(*) AS num_tiger_types
FROM taxonomy
WHERE species LIKE '%panthera tigris%';
SELECT  ncbi_id FROM taxonomy WHERE species LIKE "%Panthera tigris sumatrae%";
-- 2) Find all the columns that can be used to connect the tables in the given database.
SELECT column_name, COUNT(table_name) AS num_occurrences
FROM information_schema.columns
GROUP BY column_name
HAVING COUNT(table_name) > 1;
-- 3) Which type of rice has the longest DNA sequence? (hint: use the rfamseq and the taxonomy tables)
SELECT MAX(r.length) AS max_sequence_length FROM rfamseq AS r inner JOIN taxonomy AS t ON r.ncbi_id = t.ncbi_id WHERE t.species LIKE '%Oryza sativa%';
-- 4) We want to paginate a list of the family names and their longest DNA sequence lengths (in descending order of length) where only families that have DNA sequence lengths greater than 1,000,000 are included. Give a query that will return the 9th page when there are 15 results per page. (hint: we need the family accession ID, family name and the maximum length in the results)
SELECT f.rfam_acc, t.species AS Family_name, MAX(r.length) AS longest_dna_sequence
FROM family AS f
JOIN full_region AS fr ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq AS r ON fr.rfamseq_acc = r.rfamseq_acc
JOIN taxonomy AS t ON r.ncbi_id = t.ncbi_id
GROUP BY f.rfam_acc, t.species
HAVING longest_dna_sequence > 1000000
ORDER BY longest_dna_sequence DESC
LIMIT 15 OFFSET 120;
