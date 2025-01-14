-- Stale PRs
SELECT
  p.number
, p.title || ' @' || format('https://github.com/trinodb/trino/pull/%s', p.number) AS title
, day(current_timestamp - p.updated_at) AS days_since_updated
FROM unique_pulls p
WHERE owner = 'trinodb' AND repo = 'trino' AND state = 'open' AND NOT draft
ORDER BY 3 DESC
LIMIT 20
;
