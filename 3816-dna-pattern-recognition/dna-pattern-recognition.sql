# Write your MySQL query statement below
select sample_id, dna_sequence, species,
Case when dna_sequence like 'ATG%' Then 1 else 0 end as has_start,
Case when dna_sequence like '%TAA' Then 1 when dna_sequence like '%TAG' Then 1 when dna_sequence like '%TGA' Then 1 else 0 end as has_stop,
Case when dna_sequence like 'ATAT%' Then 1 when dna_sequence like '%ATAT%' Then 1 when dna_sequence like '%ATAT' Then 1 else 0 end as has_atat,
Case when dna_sequence like 'GGG%' Then 1 when dna_sequence like '%GGG%' Then 1 when dna_sequence like '%GGG' Then 1 else 0 end as has_ggg
from samples;