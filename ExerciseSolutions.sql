SELECT *, 
COUNT(*) OVER(PARTITION BY member_id) AS member_claim_count,
SUM(paid_amount) OVER(PARTITION BY member_id) Member_total_paid,
paid_amount/SUM(paid_amount) OVER(PARTITION BY member_id) AS pct_of_member_total_paid,
AVG(paid_amount) OVER() AS avg_per_claim_for_all_claims,
paid_amount/AVG(paid_amount) OVER() claim_paid_vs_avg_paid
FROM claims
