SELECT 
    distinct count(*) OVER (PARTITION by c.name, review_status),
    COALESCE(review_status, 'IN PROGRESS') as "Review Status", 
    c.name as "User"

FROM entry$raw a
LEFT JOIN author$raw b on a.id = b.entry_id
LEFT JOIN user$raw c on b.user_id = c.id 
LEFT JOIN project$raw d on d.id = a.source_id
where d.name = 'QCRG' and (a.review_status = 'ACCEPTED' or a.review_status = 'NEEDS_REVIEW' or a.review_status is null)
ORDER BY c.name ASC

/*View as a 'Bar chart' with 'X axis' = User, 'Y axis' = Count, 'Series' = Review Status*/
