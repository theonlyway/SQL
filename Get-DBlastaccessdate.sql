SELECT DatabaseName, MAX(LastAccessDate) LastAccessDate
FROM
    (SELECT
        DB_NAME(database_id) DatabaseName
        , last_user_seek
        , last_user_scan
        , last_user_lookup
        , last_user_update
    FROM sys.dm_db_index_usage_stats) AS PivotTable
UNPIVOT 
    (LastAccessDate FOR last_user_access IN
        (last_user_seek
        , last_user_scan
        , last_user_lookup
        , last_user_update)
    ) AS UnpivotTable
GROUP BY DatabaseName
HAVING DatabaseName NOT IN ('master', 'tempdb', 'model', 'msdb')
ORDER BY 2