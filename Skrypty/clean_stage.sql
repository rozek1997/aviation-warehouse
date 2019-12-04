create procedure cleanDatabase as
exec sp_MSforeachtable'TRUNCATE TABLE?'
