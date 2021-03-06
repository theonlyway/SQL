/*********************************************/
--Script: Captures Buffer Pool Usage
--Works On: 2008, 2008 R2, 2012, 2014, 2016
/*********************************************/

-- SQL server 2008 / 2008 R2

SELECT
     (bpool_committed*8)/1024.0 as BPool_Committed_MB,
     (bpool_commit_target*8)/1024.0 as BPool_Commit_Tgt_MB,
     (bpool_visible*8)/1024.0 as BPool_Visible_MB
FROM sys.dm_os_sys_info;

-- SQL server 2012 / 2014 / 2016
SELECT
      (committed_kb)/1024.0 as BPool_Committed_MB,
      (committed_target_kb)/1024.0 as BPool_Commit_Tgt_MB,
      (visible_target_kb)/1024.0 as BPool_Visible_MB
FROM  sys.dm_os_sys_info;