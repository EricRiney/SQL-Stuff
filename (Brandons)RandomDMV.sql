/* Dynamic management views and functions return server state information that can be used to monitor the health of a server instance, diagnose problems, and tune performance.

There are two types of dynamic management views and functions

-Server-scoped dyanmic management views and functions. 
	<-- These require VIEW SERVER STATE permission on the server

-Database-scoped dynamic management views and functions.
	<-- These require VIEW DATABASE STATE permission on the server

[QUERYING DYNAMIC MANAGEMENT VIEWS]

Can be referenced in Transact-SQL (T-SQL) 

example:*/
SELECT * --It is recommended to do SELECT * incase it breaks program
FROM sys.dm_os_wait_stats;
GO
-- Returns information about all the waits encountered by threads that executed. You can use this aggregated view to diagnose performance issues with SQL Server and also with specific queries and batches.
--The signal_wait_time_ms then is actually a measure of the wait time to get at the CPU. This makes it an excellent measure of how much load your CPU is carrying. Because of this, while you should absolutely look at wait statistics in general, you should always focus in on the signal_wait_time_ms separately in order to understand how well your CPU is performing


SELECT *
FROM sys.dm_exec_sessions --info about all active user connections and internal tasks


SELECT *
FROM sys.dm_os_sys_memory
-- how memory is used overall on the server, and how much memory is available.



/*
This one is particularly good because it allows you to track down the culprit without use of external tools
Good for environments where monitoring memory usage is necessary*/
DBCC MEMORYSTATUS()
-- displays various memory allocatoin and management processes within SQL Server. 
-- it is possible t otarget a few particular pieces of information

--try
USE SKI_BOARD_MFG
SELECT *
FROM sys.dm_io_virtual_file_stats((SELECT DB_ID()), NULL) as divfs;



SELECT *
FROM sys.dm_io_virtual_file_stats(DB_ID(DB_NAME()), NULL) as divfs; -- THIS IS A DMF

exec sp_who2 --people on server
exec sp_lock --all locks
DBCC opentran --open transactions

-- CTRL ALT A opens up activity monitor in SQL Server

Select * 
From sys.sysprocesses


restore filelistonly from disk = 'C:\sql\goofjune2.bak'

restore database SKI_BOARD_MFG from disk = 'C:\sql\goofjune2.bak'
with replace, file = 1, norecovery, stats

restore log SKI_BOARD_MFG from disk = 'C:\sql\goofjune2.bak'
with replace, file = 3, recovery, stats, stopat = '2016-06-02 17:58:10.000'


