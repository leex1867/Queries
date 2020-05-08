SELECT *, 
COUNT(*) OVER(PARTITION BY member_id) AS claim_count_per_member,
SUM(paid_amount) OVER(PARTITION BY member_id) total_paid_per_member,
paid_amount/SUM(paid_amount) OVER(PARTITION BY member_id) AS claim_paid_amount_over_member_total_paid_amount,
AVG(paid_amount) OVER() AS avg_per_claim_for_all_claims,
paid_amount/AVG(paid_amount) OVER() claim_paid_vs_avg_paid,
CASE WHEN paid_amount = max(paid_amount) over(partition by member_id) then true else false as members_most_expensive_claim
FROM claims
