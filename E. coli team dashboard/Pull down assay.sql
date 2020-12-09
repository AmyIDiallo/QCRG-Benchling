SELECT
    strainviral as "Viral protein",
    strainhost as "Host protein",
    interaction as "Interaction validation",
    entry_id$ as "Notebook"
FROM qcrg.ecoli_pull_down_assay
order by CAST(created_at$ AS DATE) desc
