WITH
actual AS (
  SELECT
    "groupID" AS issue_id,
    COUNT(*) AS event_count,
    MIN("dateCreated"::TIMESTAMP WITH TIME ZONE) AS earliest_event,
    MAX("dateCreated"::TIMESTAMP WITH TIME ZONE) AS latest_event
  FROM events
  GROUP BY 1
),
issue_stats AS (
  SELECT
    i.id,
    i.count::INT AS expected_event_count,
    DATE_TRUNC('second', i."firstSeen"::TIMESTAMP WITH TIME ZONE) AS expected_earliest_event,
    DATE_TRUNC('second', i."lastSeen"::TIMESTAMP WITH TIME ZONE) AS expected_latest_event,
    a.event_count AS actual_event_count,
    a.earliest_event AS actual_earliest_event,
    a.latest_event AS actual_latest_event
  FROM issues i
  LEFT JOIN actual a ON a.issue_id = i.id
)
SELECT
  FORMAT(
    'issue %s has %s/%s events; earliest: %s (expected %s); latest: %s (expected %s)',
    id, actual_event_count, expected_event_count,
    actual_earliest_event, expected_earliest_event,
    actual_latest_event, expected_latest_event
  )
FROM issue_stats
WHERE actual_event_count != expected_event_count
  OR actual_earliest_event != expected_earliest_event
  OR actual_latest_event != expected_latest_event;
