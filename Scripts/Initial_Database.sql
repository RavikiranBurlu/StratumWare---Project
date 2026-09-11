/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
    Create the StratumWare database and set up the
    Bronze, Silver, and Gold schemas.

WARNING:
    If StratumWare already exists, this script will delete it
    and create a new empty database.
    Any existing data inside the database will be lost.
=============================================================
*/

USE master;
GO

-- Check if the database already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'StratumWare')
BEGIN
    -- Disconnect active users and roll back their transactions
    ALTER DATABASE StratumWare
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    -- Delete the existing database
    DROP DATABASE StratumWare;
END;
GO

-- Create a new database
CREATE DATABASE StratumWare;
GO

-- Switch to the new database
USE StratumWare;
GO

-- Create the three layers of the data warehouse
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
