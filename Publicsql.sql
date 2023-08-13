SELECT COUNT(*) AS num_tiger_types
FROM taxonomy
WHERE species LIKE '%panthera tigris%';
SELECT  ncbi_id FROM taxonomy WHERE species LIKE "%Panthera tigris sumatrae%";
