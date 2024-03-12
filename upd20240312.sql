IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220322081529_InitialCreation')
BEGIN
    CREATE TABLE [WeatherForecasts] (
        [Id] int NOT NULL IDENTITY,
        [Date] datetime2 NOT NULL,
        [TemperatureC] int NOT NULL,
        [Summary] nvarchar(max) NULL,
        CONSTRAINT [PK_WeatherForecasts] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220322081529_InitialCreation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220322081529_InitialCreation', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324115610_Order_OrderRow_RowCertificate')
BEGIN
    CREATE TABLE [Orders] (
        [Id] int NOT NULL IDENTITY,
        [OrderNumber] nvarchar(30) NOT NULL,
        [CompanyCode] nvarchar(5) NOT NULL,
        [PurchasingOrganization] nvarchar(4) NOT NULL,
        [OrderType] nvarchar(4) NOT NULL,
        [OrderStatus] nvarchar(max) NOT NULL,
        [VendorCode] nvarchar(30) NOT NULL,
        [VendorDescription] nvarchar(40) NOT NULL,
        [VendorContactPOConfirmation] nvarchar(256) NOT NULL,
        [VendorContactCertificationManagement] nvarchar(256) NOT NULL,
        [OrderDate] datetime2 NOT NULL,
        [Buyer] nvarchar(256) NOT NULL,
        [Expediter] nvarchar(10) NOT NULL,
        [Currency] nvarchar(5) NOT NULL,
        [TotalAmount] decimal(28,15) NOT NULL,
        [Incoterms] nvarchar(3) NOT NULL,
        [IncotermsLocation] nvarchar(60) NOT NULL,
        [ModeOfTransoprtation] nvarchar(2) NOT NULL,
        [PaymentTerms] nvarchar(4) NOT NULL,
        [PaymentMode] nvarchar(10) NOT NULL,
        [LinkDMS] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Orders] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324115610_Order_OrderRow_RowCertificate')
BEGIN
    CREATE TABLE [OrderRows] (
        [Id] int NOT NULL IDENTITY,
        [Item] int NOT NULL,
        [ItemStatus] nvarchar(1) NOT NULL,
        [Code_DWG] nvarchar(40) NOT NULL,
        [OWRevisionLevel] nvarchar(3) NOT NULL,
        [ItemWeight] decimal(28,15) NOT NULL,
        [WeightUM] nvarchar(3) NOT NULL,
        [BOMPosition] nvarchar(40) NOT NULL,
        [SupplyDescription] nvarchar(40) NOT NULL,
        [Plant] nvarchar(4) NOT NULL,
        [StorageLocation] nvarchar(4) NOT NULL,
        [MaterialGroup] nvarchar(9) NOT NULL,
        [Quantity] decimal(28,15) NOT NULL,
        [UM] nvarchar(3) NOT NULL,
        [TotalAmount] decimal(28,15) NOT NULL,
        [TaxCode] nvarchar(2) NOT NULL,
        [DeliveryDate] datetime2 NOT NULL,
        [CostCenter] nvarchar(10) NOT NULL,
        [SONumber] nvarchar(10) NOT NULL,
        [SOItem] int NOT NULL,
        [AssetNumber] nvarchar(12) NOT NULL,
        [ExpectedDate] datetime2 NOT NULL,
        [ETA] datetime2 NOT NULL,
        [ReadyForDeliveryDate] datetime2 NOT NULL,
        [LinkDMS] nvarchar(max) NOT NULL,
        [OrderId] int NOT NULL,
        CONSTRAINT [PK_OrderRows] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_OrderRows_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324115610_Order_OrderRow_RowCertificate')
BEGIN
    CREATE TABLE [RowCertificates] (
        [Id] int NOT NULL IDENTITY,
        [Component] nvarchar(40) NOT NULL,
        [DocumentType] nvarchar(2) NOT NULL,
        [CertificateType] nvarchar(40) NOT NULL,
        [CertificateTypeDescription] nvarchar(40) NOT NULL,
        [HPFlag] nvarchar(1) NOT NULL,
        [REParameter] nvarchar(1) NOT NULL,
        [Status] nvarchar(4) NOT NULL,
        [ReceiptDate] datetime2 NOT NULL,
        [Checker] nvarchar(10) NOT NULL,
        [VerificationReasonCode] nvarchar(40) NOT NULL,
        [CertificationDate] datetime2 NOT NULL,
        [LinkDMS] nvarchar(70) NOT NULL,
        [CountryOfOrigin] nvarchar(3) NOT NULL,
        [Notes] nvarchar(255) NOT NULL,
        [OrderRowId] int NOT NULL,
        CONSTRAINT [PK_RowCertificates] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_RowCertificates_OrderRows_OrderRowId] FOREIGN KEY ([OrderRowId]) REFERENCES [OrderRows] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324115610_Order_OrderRow_RowCertificate')
BEGIN
    CREATE INDEX [IX_OrderRows_OrderId] ON [OrderRows] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324115610_Order_OrderRow_RowCertificate')
BEGIN
    CREATE INDEX [IX_RowCertificates_OrderRowId] ON [RowCertificates] ([OrderRowId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324115610_Order_OrderRow_RowCertificate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220324115610_Order_OrderRow_RowCertificate', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324164819_Packaging_Order')
BEGIN
    ALTER TABLE [Orders] ADD [Packaging] nvarchar(255) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220324164819_Packaging_Order')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220324164819_Packaging_Order', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [RowCertificates] DROP CONSTRAINT [FK_RowCertificates_OrderRows_OrderRowId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [OrderRows] DROP CONSTRAINT [FK_OrderRows_Orders_OrderId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    DROP INDEX [IX_RowCertificates_OrderRowId] ON [RowCertificates];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    DROP INDEX [IX_OrderRows_OrderId] ON [OrderRows];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [RowCertificates] DROP CONSTRAINT [PK_RowCertificates];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [OrderRows] DROP CONSTRAINT [PK_OrderRows];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [Orders] DROP CONSTRAINT [PK_Orders];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'Id');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [Id] bigint NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'Id');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [Id] bigint NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'Id');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [Id] bigint NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'OrderId');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [OrderId] bigint NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'OrderRowId');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [OrderRowId] bigint NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [PK_RowCertificates] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [OrderRows] ADD CONSTRAINT [PK_OrderRows] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [OrderRows] ADD CONSTRAINT [FK_OrderRows_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_OrderRows_OrderRowId] FOREIGN KEY ([OrderRowId]) REFERENCES [OrderRows] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    CREATE INDEX [IX_OrderRows_OrderId] ON [OrderRows] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    CREATE INDEX [IX_RowCertificates_OrderRowId] ON [RowCertificates] ([OrderRowId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328093439_Int_PKeys_To_Long_PKeys')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220328093439_Int_PKeys_To_Long_PKeys', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    CREATE TABLE [Logs] (
        [Id] bigint NOT NULL IDENTITY,
        [UserName] nvarchar(450) NOT NULL,
        [EventDate] datetime2 NOT NULL,
        [Reference] nvarchar(450) NOT NULL,
        [ReferenceId] nvarchar(450) NOT NULL,
        [Action] nvarchar(50) NOT NULL,
        [EventLog] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Logs] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    CREATE TABLE [Reasons] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Reasons] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    CREATE TABLE [Roles] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    CREATE TABLE [Users] (
        [ID] int NOT NULL IDENTITY,
        [UPN] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        [RoleID] int NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    CREATE INDEX [IX_Logs_Reference] ON [Logs] ([Reference]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    CREATE INDEX [IX_Logs_ReferenceId] ON [Logs] ([ReferenceId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    CREATE INDEX [IX_Logs_UserName] ON [Logs] ([UserName]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123426_SupportEntities')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220328123426_SupportEntities', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123547_BuyerDesc_ExpediterDesc')
BEGIN
    ALTER TABLE [Orders] ADD [BuyerDescription] nvarchar(255) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123547_BuyerDesc_ExpediterDesc')
BEGIN
    ALTER TABLE [Orders] ADD [ExpediterDescription] nvarchar(255) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328123547_BuyerDesc_ExpediterDesc')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220328123547_BuyerDesc_ExpediterDesc', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328135524_Statuses_Enums')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'Status');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [Status] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328135524_Statuses_Enums')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'OrderStatus');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [OrderStatus] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328135524_Statuses_Enums')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'ItemStatus');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [ItemStatus] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328135524_Statuses_Enums')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220328135524_Statuses_Enums', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_RowCertificates_CertificationDate] ON [RowCertificates] ([CertificationDate]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_RowCertificates_Checker] ON [RowCertificates] ([Checker]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_RowCertificates_CountryOfOrigin] ON [RowCertificates] ([CountryOfOrigin]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_RowCertificates_ReceiptDate] ON [RowCertificates] ([ReceiptDate]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_RowCertificates_Status] ON [RowCertificates] ([Status]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_RowCertificates_VerificationReasonCode] ON [RowCertificates] ([VerificationReasonCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_Buyer] ON [Orders] ([Buyer]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_CompanyCode] ON [Orders] ([CompanyCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_Expediter] ON [Orders] ([Expediter]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_OrderDate] ON [Orders] ([OrderDate]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_OrderNumber] ON [Orders] ([OrderNumber]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_OrderStatus] ON [Orders] ([OrderStatus]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_OrderType] ON [Orders] ([OrderType]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_VendorCode] ON [Orders] ([VendorCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_Orders_VendorDescription] ON [Orders] ([VendorDescription]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_OrderRows_Code_DWG] ON [OrderRows] ([Code_DWG]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_OrderRows_DeliveryDate] ON [OrderRows] ([DeliveryDate]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_OrderRows_SOItem] ON [OrderRows] ([SOItem]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    CREATE INDEX [IX_OrderRows_SONumber] ON [OrderRows] ([SONumber]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220328143534_InitialIndexing')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220328143534_InitialIndexing', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220330100403_LastModified_On_Order_Entities')
BEGIN
    ALTER TABLE [RowCertificates] ADD [LastModified] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220330100403_LastModified_On_Order_Entities')
BEGIN
    ALTER TABLE [Orders] ADD [LastModified] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220330100403_LastModified_On_Order_Entities')
BEGIN
    ALTER TABLE [OrderRows] ADD [LastModified] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220330100403_LastModified_On_Order_Entities')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220330100403_LastModified_On_Order_Entities', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093417_UpdateUserEntity')
BEGIN
    EXEC sp_rename N'[Users].[ID]', N'Id', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093417_UpdateUserEntity')
BEGIN
    CREATE INDEX [IX_Users_RoleID] ON [Users] ([RoleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093417_UpdateUserEntity')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Roles_RoleID] FOREIGN KEY ([RoleID]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093417_UpdateUserEntity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220331093417_UpdateUserEntity', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093547_UpdateUserEntity2')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Roles_RoleID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093547_UpdateUserEntity2')
BEGIN
    EXEC sp_rename N'[Users].[RoleID]', N'RoleId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093547_UpdateUserEntity2')
BEGIN
    EXEC sp_rename N'[Users].[IX_Users_RoleID]', N'IX_Users_RoleId', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093547_UpdateUserEntity2')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331093547_UpdateUserEntity2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220331093547_UpdateUserEntity2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331105558_Modified_Log_Entity')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Logs]') AND [c].[name] = N'ReferenceId');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Logs] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [Logs] ALTER COLUMN [ReferenceId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220331105558_Modified_Log_Entity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220331105558_Modified_Log_Entity', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220401150540_AddedCompany')
BEGIN
    ALTER TABLE [Users] ADD [CompanyId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220401150540_AddedCompany')
BEGIN
    CREATE TABLE [Companies] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Companies] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220401150540_AddedCompany')
BEGIN
    CREATE INDEX [IX_Users_CompanyId] ON [Users] ([CompanyId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220401150540_AddedCompany')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220401150540_AddedCompany')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220401150540_AddedCompany', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220401161047_Removed_WeatherForecast')
BEGIN
    DROP TABLE [WeatherForecasts];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220401161047_Removed_WeatherForecast')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220401161047_Removed_WeatherForecast', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220404104552_Fixed_ModeOfTransportation_Typo')
BEGIN
    EXEC sp_rename N'[Orders].[ModeOfTransoprtation]', N'ModeOfTransportation', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220404104552_Fixed_ModeOfTransportation_Typo')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220404104552_Fixed_ModeOfTransportation_Typo', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220406143433_UserAuthentication')
BEGIN
    CREATE TABLE [OtpAuthentications] (
        [Id] int NOT NULL IDENTITY,
        [UserId] int NOT NULL,
        [Token] uniqueidentifier NOT NULL,
        [OTP] nvarchar(max) NOT NULL,
        [OTPExpiring] datetime2 NOT NULL,
        CONSTRAINT [PK_OtpAuthentications] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220406143433_UserAuthentication')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220406143433_UserAuthentication', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408110106_Added_Field_Uniqueness_Order_Entities')
BEGIN
    DROP INDEX [IX_RowCertificates_OrderRowId] ON [RowCertificates];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408110106_Added_Field_Uniqueness_Order_Entities')
BEGIN
    DROP INDEX [IX_Orders_OrderNumber] ON [Orders];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408110106_Added_Field_Uniqueness_Order_Entities')
BEGIN
    DROP INDEX [IX_OrderRows_OrderId] ON [OrderRows];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408110106_Added_Field_Uniqueness_Order_Entities')
BEGIN
    CREATE UNIQUE INDEX [IX_RowCertificates_OrderRowId_Component_DocumentType_CertificateType] ON [RowCertificates] ([OrderRowId], [Component], [DocumentType], [CertificateType]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408110106_Added_Field_Uniqueness_Order_Entities')
BEGIN
    CREATE UNIQUE INDEX [IX_Orders_OrderNumber] ON [Orders] ([OrderNumber]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408110106_Added_Field_Uniqueness_Order_Entities')
BEGIN
    CREATE UNIQUE INDEX [IX_OrderRows_OrderId_Item] ON [OrderRows] ([OrderId], [Item]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408110106_Added_Field_Uniqueness_Order_Entities')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220408110106_Added_Field_Uniqueness_Order_Entities', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220412091423_Email_Send')
BEGIN
    CREATE TABLE [EmailTemplate] (
        [Id] int NOT NULL IDENTITY,
        [Type] int NOT NULL,
        [Subject] nvarchar(max) NOT NULL,
        [Body] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_EmailTemplate] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220412091423_Email_Send')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220412091423_Email_Send', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429125818_DisplayName')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Companies_CompanyId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429125818_DisplayName')
BEGIN
    EXEC sp_rename N'[Orders].[ExpediterDescription]', N'ExpediterDisplayName', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429125818_DisplayName')
BEGIN
    EXEC sp_rename N'[Orders].[BuyerDescription]', N'BuyerDisplayName', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429125818_DisplayName')
BEGIN
    DROP INDEX [IX_Users_CompanyId] ON [Users];
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'CompanyId');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [Users] ALTER COLUMN [CompanyId] int NOT NULL;
    ALTER TABLE [Users] ADD DEFAULT 0 FOR [CompanyId];
    CREATE INDEX [IX_Users_CompanyId] ON [Users] ([CompanyId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429125818_DisplayName')
BEGIN
    ALTER TABLE [RowCertificates] ADD [CheckerDisplayName] nvarchar(255) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429125818_DisplayName')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429125818_DisplayName')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220429125818_DisplayName', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504135646_Users_Company_Optional')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Companies_CompanyId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504135646_Users_Company_Optional')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'CompanyId');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [Users] ALTER COLUMN [CompanyId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504135646_Users_Company_Optional')
BEGIN
    CREATE INDEX [IX_OtpAuthentications_UserId] ON [OtpAuthentications] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504135646_Users_Company_Optional')
BEGIN
    ALTER TABLE [OtpAuthentications] ADD CONSTRAINT [FK_OtpAuthentications_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504135646_Users_Company_Optional')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504135646_Users_Company_Optional')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220504135646_Users_Company_Optional', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220505154627_Reason_Type_SoftDelete')
BEGIN
    EXEC sp_rename N'[Reasons].[Name]', N'Code', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220505154627_Reason_Type_SoftDelete')
BEGIN
    ALTER TABLE [Reasons] ADD [Deleted] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220505154627_Reason_Type_SoftDelete')
BEGIN
    ALTER TABLE [Reasons] ADD [Type] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220505154627_Reason_Type_SoftDelete')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220505154627_Reason_Type_SoftDelete', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220505154700_Reason_Code_Uniqueness')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Reasons]') AND [c].[name] = N'Code');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Reasons] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [Reasons] ALTER COLUMN [Code] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220505154700_Reason_Code_Uniqueness')
BEGIN
    CREATE UNIQUE INDEX [IX_Reasons_Code] ON [Reasons] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220505154700_Reason_Code_Uniqueness')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220505154700_Reason_Code_Uniqueness', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220506104914_EID_272_EID_276')
BEGIN
    EXEC sp_rename N'[Users].[Description]', N'DisplayName', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220506104914_EID_272_EID_276')
BEGIN
    ALTER TABLE [Companies] ADD [Deleted] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220506104914_EID_272_EID_276')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220506104914_EID_272_EID_276', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220506130138_User_UPN_Unique')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'UPN');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [Users] ALTER COLUMN [UPN] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220506130138_User_UPN_Unique')
BEGIN
    CREATE UNIQUE INDEX [IX_Users_UPN] ON [Users] ([UPN]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220506130138_User_UPN_Unique')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220506130138_User_UPN_Unique', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220509133419_Improved_Uniqueness')
BEGIN
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Roles]') AND [c].[name] = N'Name');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Roles] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [Roles] ALTER COLUMN [Name] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220509133419_Improved_Uniqueness')
BEGIN
    DECLARE @var14 sysname;
    SELECT @var14 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Companies]') AND [c].[name] = N'Name');
    IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [Companies] DROP CONSTRAINT [' + @var14 + '];');
    ALTER TABLE [Companies] ALTER COLUMN [Name] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220509133419_Improved_Uniqueness')
BEGIN
    CREATE UNIQUE INDEX [IX_Roles_Name] ON [Roles] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220509133419_Improved_Uniqueness')
BEGIN
    CREATE UNIQUE INDEX [IX_OtpAuthentications_Token] ON [OtpAuthentications] ([Token]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220509133419_Improved_Uniqueness')
BEGIN
    CREATE UNIQUE INDEX [IX_Companies_Name] ON [Companies] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220509133419_Improved_Uniqueness')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220509133419_Improved_Uniqueness', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    DROP INDEX [IX_Users_UPN] ON [Users];
    DECLARE @var15 sysname;
    SELECT @var15 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'UPN');
    IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var15 + '];');
    ALTER TABLE [Users] ALTER COLUMN [UPN] nvarchar(200) NOT NULL;
    CREATE UNIQUE INDEX [IX_Users_UPN] ON [Users] ([UPN]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    DROP INDEX [IX_RowCertificates_Checker] ON [RowCertificates];
    DECLARE @var16 sysname;
    SELECT @var16 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'Checker');
    IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var16 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [Checker] nvarchar(200) NOT NULL;
    CREATE INDEX [IX_RowCertificates_Checker] ON [RowCertificates] ([Checker]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    DROP INDEX [IX_Reasons_Code] ON [Reasons];
    DECLARE @var17 sysname;
    SELECT @var17 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Reasons]') AND [c].[name] = N'Code');
    IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [Reasons] DROP CONSTRAINT [' + @var17 + '];');
    ALTER TABLE [Reasons] ALTER COLUMN [Code] nvarchar(40) NOT NULL;
    CREATE UNIQUE INDEX [IX_Reasons_Code] ON [Reasons] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    DROP INDEX [IX_Orders_Expediter] ON [Orders];
    DECLARE @var18 sysname;
    SELECT @var18 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'Expediter');
    IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var18 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [Expediter] nvarchar(200) NOT NULL;
    CREATE INDEX [IX_Orders_Expediter] ON [Orders] ([Expediter]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    DROP INDEX [IX_Orders_CompanyCode] ON [Orders];
    DECLARE @var19 sysname;
    SELECT @var19 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'CompanyCode');
    IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var19 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [CompanyCode] nvarchar(40) NOT NULL;
    CREATE INDEX [IX_Orders_CompanyCode] ON [Orders] ([CompanyCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    DROP INDEX [IX_Orders_Buyer] ON [Orders];
    DECLARE @var20 sysname;
    SELECT @var20 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'Buyer');
    IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var20 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [Buyer] nvarchar(200) NOT NULL;
    CREATE INDEX [IX_Orders_Buyer] ON [Orders] ([Buyer]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    DROP INDEX [IX_Companies_Name] ON [Companies];
    DECLARE @var21 sysname;
    SELECT @var21 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Companies]') AND [c].[name] = N'Name');
    IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [Companies] DROP CONSTRAINT [' + @var21 + '];');
    ALTER TABLE [Companies] ALTER COLUMN [Name] nvarchar(40) NOT NULL;
    CREATE UNIQUE INDEX [IX_Companies_Name] ON [Companies] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220511081016_Adjusted_Fields_Length')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220511081016_Adjusted_Fields_Length', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518122318_Attachments')
BEGIN
    CREATE TABLE [Attachments] (
        [Id] bigint NOT NULL IDENTITY,
        [OrderId] bigint NULL,
        [OrderRowId] bigint NULL,
        [RowCertificateId] bigint NULL,
        [DmsId] bigint NOT NULL,
        [FileName] nvarchar(255) NOT NULL,
        [DocumentType] nvarchar(255) NOT NULL,
        [LastModified] datetime2 NOT NULL,
        CONSTRAINT [PK_Attachments] PRIMARY KEY ([Id]),
        CONSTRAINT [CK_OrderId_OrderRowId_RowCertificateId] CHECK ((OrderId IS NOT NULL AND OrderRowId IS NULL AND RowCertificateId IS NULL)
                 OR (OrderId IS NULL AND OrderRowId IS NOT NULL AND RowCertificateId IS NULL)
                 OR (OrderId IS NULL AND OrderRowId IS NULL AND RowCertificateId IS NOT NULL)),
        CONSTRAINT [FK_Attachments_OrderRows_OrderRowId] FOREIGN KEY ([OrderRowId]) REFERENCES [OrderRows] ([Id]),
        CONSTRAINT [FK_Attachments_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([Id]),
        CONSTRAINT [FK_Attachments_RowCertificates_RowCertificateId] FOREIGN KEY ([RowCertificateId]) REFERENCES [RowCertificates] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518122318_Attachments')
BEGIN
    CREATE INDEX [IX_Attachments_OrderId] ON [Attachments] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518122318_Attachments')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_Attachments_OrderId_OrderRowId_RowCertificateId_DmsId] ON [Attachments] ([OrderId], [OrderRowId], [RowCertificateId], [DmsId]) WHERE [OrderId] IS NOT NULL AND [OrderRowId] IS NOT NULL AND [RowCertificateId] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518122318_Attachments')
BEGIN
    CREATE INDEX [IX_Attachments_OrderRowId] ON [Attachments] ([OrderRowId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518122318_Attachments')
BEGIN
    CREATE INDEX [IX_Attachments_RowCertificateId] ON [Attachments] ([RowCertificateId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518122318_Attachments')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220518122318_Attachments', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518133502_Added_Attachment_Origin')
BEGIN
    ALTER TABLE [Attachments] ADD [Origin] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518133502_Added_Attachment_Origin')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220518133502_Added_Attachment_Origin', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220525204824_EmailTemplates')
BEGIN
    ALTER TABLE [EmailTemplate] DROP CONSTRAINT [PK_EmailTemplate];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220525204824_EmailTemplates')
BEGIN
    EXEC sp_rename N'[EmailTemplate]', N'EmailTemplates';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220525204824_EmailTemplates')
BEGIN
    ALTER TABLE [EmailTemplates] ADD CONSTRAINT [PK_EmailTemplates] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220525204824_EmailTemplates')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220525204824_EmailTemplates', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220530104100_LastPeriodicalUpdateMail')
BEGIN
    ALTER TABLE [Users] ADD [LastPeriodicalUpdateMail] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220530104100_LastPeriodicalUpdateMail')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220530104100_LastPeriodicalUpdateMail', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220608104103_CountryOfOrigin')
BEGIN
    UPDATE RowCertificates SET CountryOfOrigin = LEFT(CountryOfOrigin, 2)
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220608104103_CountryOfOrigin')
BEGIN
    DROP INDEX [IX_RowCertificates_CountryOfOrigin] ON [RowCertificates];
    DECLARE @var22 sysname;
    SELECT @var22 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'CountryOfOrigin');
    IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var22 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [CountryOfOrigin] nvarchar(2) NOT NULL;
    CREATE INDEX [IX_RowCertificates_CountryOfOrigin] ON [RowCertificates] ([CountryOfOrigin]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220608104103_CountryOfOrigin')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220608104103_CountryOfOrigin', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613074440_HasBill')
BEGIN
    ALTER TABLE [OrderRows] ADD [HasBill] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613074440_HasBill')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220613074440_HasBill', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613084302_DocumentType')
BEGIN
    delete from Attachments
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613084302_DocumentType')
BEGIN
    DECLARE @var23 sysname;
    SELECT @var23 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Attachments]') AND [c].[name] = N'DocumentType');
    IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [Attachments] DROP CONSTRAINT [' + @var23 + '];');
    ALTER TABLE [Attachments] DROP COLUMN [DocumentType];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613084302_DocumentType')
BEGIN
    ALTER TABLE [Attachments] ADD [DocumentType] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613084302_DocumentType')
BEGIN
    ALTER TABLE [Attachments] ADD [DocumentTypeDescription] nvarchar(255) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613084302_DocumentType')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220613084302_DocumentType', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DROP INDEX [IX_OrderRows_Code_DWG] ON [OrderRows];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var24 sysname;
    SELECT @var24 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'LinkDMS');
    IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var24 + '];');
    ALTER TABLE [RowCertificates] DROP COLUMN [LinkDMS];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var25 sysname;
    SELECT @var25 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'LinkDMS');
    IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var25 + '];');
    ALTER TABLE [Orders] DROP COLUMN [LinkDMS];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var26 sysname;
    SELECT @var26 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'Packaging');
    IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var26 + '];');
    ALTER TABLE [Orders] DROP COLUMN [Packaging];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var27 sysname;
    SELECT @var27 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'Code_DWG');
    IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var27 + '];');
    ALTER TABLE [OrderRows] DROP COLUMN [Code_DWG];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var28 sysname;
    SELECT @var28 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'LinkDMS');
    IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var28 + '];');
    ALTER TABLE [OrderRows] DROP COLUMN [LinkDMS];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var29 sysname;
    SELECT @var29 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'VerificationReasonCode');
    IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var29 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [VerificationReasonCode] nvarchar(40) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var30 sysname;
    SELECT @var30 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'ReceiptDate');
    IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var30 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [ReceiptDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var31 sysname;
    SELECT @var31 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'REParameter');
    IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var31 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [REParameter] nvarchar(1) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var32 sysname;
    SELECT @var32 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'Notes');
    IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var32 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [Notes] nvarchar(255) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var33 sysname;
    SELECT @var33 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'HPFlag');
    IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var33 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [HPFlag] nvarchar(1) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var34 sysname;
    SELECT @var34 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'CountryOfOrigin');
    IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var34 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [CountryOfOrigin] nvarchar(2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var35 sysname;
    SELECT @var35 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'CheckerDisplayName');
    IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var35 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [CheckerDisplayName] nvarchar(255) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var36 sysname;
    SELECT @var36 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'Checker');
    IF @var36 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var36 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [Checker] nvarchar(200) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var37 sysname;
    SELECT @var37 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'CertificationDate');
    IF @var37 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var37 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [CertificationDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var38 sysname;
    SELECT @var38 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'PaymentTerms');
    IF @var38 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var38 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [PaymentTerms] nvarchar(4) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var39 sysname;
    SELECT @var39 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'PaymentMode');
    IF @var39 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var39 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [PaymentMode] nvarchar(10) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var40 sysname;
    SELECT @var40 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'ModeOfTransportation');
    IF @var40 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var40 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [ModeOfTransportation] nvarchar(2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var41 sysname;
    SELECT @var41 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'IncotermsLocation');
    IF @var41 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var41 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [IncotermsLocation] nvarchar(60) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var42 sysname;
    SELECT @var42 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'Incoterms');
    IF @var42 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var42 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [Incoterms] nvarchar(3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var43 sysname;
    SELECT @var43 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'ExpediterDisplayName');
    IF @var43 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var43 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [ExpediterDisplayName] nvarchar(255) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var44 sysname;
    SELECT @var44 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'Expediter');
    IF @var44 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var44 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [Expediter] nvarchar(200) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var45 sysname;
    SELECT @var45 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'WeightUM');
    IF @var45 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var45 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [WeightUM] nvarchar(3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var46 sysname;
    SELECT @var46 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'TaxCode');
    IF @var46 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var46 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [TaxCode] nvarchar(2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var47 sysname;
    SELECT @var47 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'StorageLocation');
    IF @var47 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var47 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [StorageLocation] nvarchar(4) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var48 sysname;
    SELECT @var48 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'SONumber');
    IF @var48 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var48 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [SONumber] nvarchar(10) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var49 sysname;
    SELECT @var49 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'SOItem');
    IF @var49 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var49 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [SOItem] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var50 sysname;
    SELECT @var50 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'ReadyForDeliveryDate');
    IF @var50 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var50 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [ReadyForDeliveryDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var51 sysname;
    SELECT @var51 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'Plant');
    IF @var51 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var51 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [Plant] nvarchar(4) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var52 sysname;
    SELECT @var52 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'OWRevisionLevel');
    IF @var52 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var52 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [OWRevisionLevel] nvarchar(3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var53 sysname;
    SELECT @var53 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'MaterialGroup');
    IF @var53 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var53 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [MaterialGroup] nvarchar(9) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var54 sysname;
    SELECT @var54 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'ItemWeight');
    IF @var54 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var54 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [ItemWeight] decimal(28,15) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var55 sysname;
    SELECT @var55 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'ExpectedDate');
    IF @var55 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var55 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [ExpectedDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var56 sysname;
    SELECT @var56 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'ETA');
    IF @var56 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var56 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [ETA] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var57 sysname;
    SELECT @var57 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'DeliveryDate');
    IF @var57 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var57 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [DeliveryDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var58 sysname;
    SELECT @var58 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'CostCenter');
    IF @var58 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var58 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [CostCenter] nvarchar(10) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var59 sysname;
    SELECT @var59 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'BOMPosition');
    IF @var59 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var59 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [BOMPosition] nvarchar(40) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    DECLARE @var60 sysname;
    SELECT @var60 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'AssetNumber');
    IF @var60 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var60 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [AssetNumber] nvarchar(12) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    ALTER TABLE [OrderRows] ADD [AccountAssignmentCategory] nvarchar(1) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    ALTER TABLE [OrderRows] ADD [CodeDWG] nvarchar(40) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    ALTER TABLE [OrderRows] ADD [CountryRestriction] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    ALTER TABLE [OrderRows] ADD [ItemCategory] nvarchar(1) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    CREATE INDEX [IX_OrderRows_CodeDWG] ON [OrderRows] ([CodeDWG]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220614143110_Structure_Update')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220614143110_Structure_Update', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220616124704_Verification_Reason_Code')
BEGIN
    DROP INDEX [IX_RowCertificates_VerificationReasonCode] ON [RowCertificates];
    DECLARE @var61 sysname;
    SELECT @var61 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'VerificationReasonCode');
    IF @var61 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var61 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [VerificationReasonCode] nvarchar(4) NULL;
    CREATE INDEX [IX_RowCertificates_VerificationReasonCode] ON [RowCertificates] ([VerificationReasonCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220616124704_Verification_Reason_Code')
BEGIN
    DROP INDEX [IX_Reasons_Code] ON [Reasons];
    DECLARE @var62 sysname;
    SELECT @var62 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Reasons]') AND [c].[name] = N'Code');
    IF @var62 IS NOT NULL EXEC(N'ALTER TABLE [Reasons] DROP CONSTRAINT [' + @var62 + '];');
    ALTER TABLE [Reasons] ALTER COLUMN [Code] nvarchar(4) NOT NULL;
    CREATE UNIQUE INDEX [IX_Reasons_Code] ON [Reasons] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220616124704_Verification_Reason_Code')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220616124704_Verification_Reason_Code', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220630105021_email_templates_parameters')
BEGIN
    CREATE TABLE [EmailTemplateParameters] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(450) NOT NULL,
        [Body] nvarchar(max) NOT NULL,
        [ContainsSingleValue] bit NOT NULL,
        [EmailTemplateId] int NOT NULL,
        CONSTRAINT [PK_EmailTemplateParameters] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_EmailTemplateParameters_EmailTemplates_EmailTemplateId] FOREIGN KEY ([EmailTemplateId]) REFERENCES [EmailTemplates] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220630105021_email_templates_parameters')
BEGIN
    CREATE INDEX [IX_EmailTemplateParameters_EmailTemplateId] ON [EmailTemplateParameters] ([EmailTemplateId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220630105021_email_templates_parameters')
BEGIN
    CREATE UNIQUE INDEX [IX_EmailTemplateParameters_Name_EmailTemplateId] ON [EmailTemplateParameters] ([Name], [EmailTemplateId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220630105021_email_templates_parameters')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220630105021_email_templates_parameters', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220708105043_email_template_params_default_value')
BEGIN
    ALTER TABLE [EmailTemplateParameters] ADD [DefaultValue] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220708105043_email_template_params_default_value')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220708105043_email_template_params_default_value', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803094253_CountryEntity')
BEGIN
    CREATE TABLE [Countries] (
        [Id] int NOT NULL IDENTITY,
        [Code] nvarchar(4) NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Deleted] bit NOT NULL,
        CONSTRAINT [PK_Countries] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803094253_CountryEntity')
BEGIN
    CREATE UNIQUE INDEX [IX_Countries_Code] ON [Countries] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803094253_CountryEntity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220803094253_CountryEntity', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803100848_FillCountries')
BEGIN
    INSERT INTO Countries ([Code], [Name], [Deleted]) VALUES ('AG', 'Antigua/Barbuda', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AI', 'Anguilla', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AL', 'Albania', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AM', 'Armenia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AO', 'Angola', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AQ', 'Antarctica', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AR', 'Argentina', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AS', 'Samoa, America', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AT', 'Austria', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AU', 'Australia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AW', 'Aruba', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AX', 'Aland Islands', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('AZ', 'Azerbaijan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BA', 'Bosnia-Herz.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BB', 'Barbados', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BD', 'Bangladesh', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BE', 'Belgium', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BF', 'Burkina Faso', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BG', 'Bulgaria', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BH', 'Bahrain', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BI', 'Burundi', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BJ', 'Benin', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BL', 'St. Barthelemy', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BM', 'Bermuda', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BN', 'Brunei Daruss.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BO', 'Bolivia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BQ', 'Bonaire, Saba', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BR', 'Brazil', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BS', 'Bahamas', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BT', 'Bhutan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BV', 'Bouvet Island', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BW', 'Botswana', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BY', 'Belarus', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('BZ', 'Belize', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CA', 'Canada', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CC', 'Keeling Islands', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CD', 'Rep.of Congo', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CF', 'Cent. Afr. Rep.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CG', 'Rep.of Congo', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CH', 'Switzerland', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CI', 'Cote d''Ivoire', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CK', 'Cook Islands', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CL', 'Chile', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CM', 'Cameroon', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CN', 'China', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CO', 'Colombia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CR', 'Costa Rica', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CU', 'Cuba', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CV', 'Cabo Verde', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CW', 'Curacao', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CX', 'Christmas Islnd', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CY', 'Cyprus', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('CZ', 'Czech Republic', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('DE', 'Germany', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('DJ', 'Djibouti', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('DK', 'Denmark', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('DM', 'Dominica', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('DO', 'Dominican Rep.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('DZ', 'Algeria', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('EC', 'Ecuador', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('EE', 'Estonia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('EG', 'Egypt', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('EH', 'Western Sahara', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ER', 'Eritrea', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ES', 'Spain', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ET', 'Ethiopia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('EU', 'European Union', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('FI', 'Finland', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('FJ', 'Fiji', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('FK', 'Falkland Islnds', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('FM', 'Micronesia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('FO', 'Faroe Islands', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('FR', 'France', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GA', 'Gabon', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GB', 'United Kingdom', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GD', 'Grenada', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GE', 'Georgia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GF', 'French Guiana', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GG', 'Guernsey', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GH', 'Ghana', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GI', 'Gibraltar', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GL', 'Greenland', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GM', 'Gambia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GN', 'Guinea', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GP', 'Guadeloupe', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GQ', 'Equatorial Guin', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GR', 'Greece', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GS', 'S. Sandwich Ins', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GT', 'Guatemala', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GU', 'Guam', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GW', 'Guinea-Bissau', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('GY', 'Guyana', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('HK', 'Hong Kong', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('HM', 'Heard/McDon.Isl', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('HN', 'Honduras', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('HR', 'Croatia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('HT', 'Haiti', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('HU', 'Hungary', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ID', 'Indonesia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IE', 'Ireland', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IL', 'Israel', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IM', 'Isle of Man', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IN', 'India', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IO', 'Brit.Ind.Oc.Ter', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IQ', 'Iraq', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IR', 'Iran', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IS', 'Iceland', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('IT', 'Italy', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('JE', 'Jersey', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('JM', 'Jamaica', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('JO', 'Jordan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('JP', 'Japan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KE', 'Kenya', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KG', 'Kyrgyzstan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KH', 'Cambodia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KI', 'Kiribati', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KM', 'Comoros', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KN', 'St Kitts&Nevis', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KP', 'North Korea', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KR', 'South Korea', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KW', 'Kuwait', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KY', 'Cayman Islands', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('KZ', 'Kazakhstan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LA', 'Laos', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LB', 'Lebanon', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LC', 'Saint Lucia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LI', 'Liechtenstein', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LK', 'Sri Lanka', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LR', 'Liberia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LS', 'Lesotho', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LT', 'Lithuania', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LU', 'Luxembourg', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LV', 'Latvia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('LY', 'Libya', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MA', 'Morocco', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MC', 'Monaco', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MD', 'Moldova', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ME', 'Montenegro', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MF', 'St. Martin', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MG', 'Madagascar', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MH', 'Marshall Islnds', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MK', 'North Macedonia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ML', 'Mali', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MM', 'Myanmar', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MN', 'Mongolia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MO', 'Macao', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MP', 'N.Mariana Islnd', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MQ', 'Martinique', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MR', 'Mauritania', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MS', 'Montserrat', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MT', 'Malta', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MU', 'Mauritius', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MV', 'Maldives', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MW', 'Malawi', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MX', 'Mexico', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MY', 'Malaysia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('MZ', 'Mozambique', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NA', 'Namibia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NC', 'New Caledonia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NE', 'Niger', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NF', 'Norfolk Island', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NG', 'Nigeria', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NI', 'Nicaragua', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NL', 'Netherlands', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NO', 'Norway', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NP', 'Nepal', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NR', 'Nauru', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NT', 'NATO', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NU', 'Niue', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('NZ', 'New Zealand', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('OM', 'Oman', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('OR', 'Orange', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PA', 'Panama', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PE', 'Peru', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PF', 'Frenc.Polynesia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PG', 'Pap. New Guinea', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PH', 'Philippines', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PK', 'Pakistan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PL', 'Poland', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PM', 'StPier.,Miquel.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PN', 'Pitcairn Is.Gr.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PR', 'Puerto Rico', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PS', 'Palestine', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PT', 'Portugal', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PW', 'Palau', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('PY', 'Paraguay', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('QA', 'Qatar', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('RE', 'Reunion', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('RO', 'Romania', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('RS', 'Serbia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('RU', 'Russian Fed.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('RW', 'Rwanda', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SA', 'Saudi Arabia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SB', 'Solomon Islands', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SC', 'Seychelles', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SD', 'Sudan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SE', 'Sweden', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SG', 'Singapore', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SH', 'Saint Helena', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SI', 'Slovenia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SJ', 'Spitzbergen', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SK', 'Slovakia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SL', 'Sierra Leone', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SM', 'San Marino', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SN', 'Senegal', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SO', 'Somalia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SR', 'Suri[Name]', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SS', 'South Sudan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ST', 'S.Tome,Principe', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SV', 'El Salvador', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SX', 'Sint Maarten', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SY', 'Syria', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('SZ', 'Eswatini', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TC', 'Turks&Caicos I.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TD', 'Chad', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TF', 'French S.Territ', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TG', 'Togo', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TH', 'Thailand', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TJ', 'Tajikistan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TK', 'Tokelau', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TL', 'Timor-Leste', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TM', 'Turkmenistan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TN', 'Tunisia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TO', 'Tonga', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TR', 'Turkey', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TT', 'Trinidad,Tobago', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TV', 'Tuvalu', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TW', 'Taiwan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('TZ', 'Tanzania', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('UA', 'Ukraine', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('UG', 'Uganda', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('UM', 'Minor Outl.Isl.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('UN', 'United Nations', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('US', 'USA', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('UY', 'Uruguay', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('UZ', 'Uzbekistan', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('VA', 'Vatican City', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('VC', 'Saint Vincent', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('VE', 'Venezuela', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('VG', 'Brit.Virgin Is.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('VI', 'US Virgin Isl.', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('VN', 'Vietnam', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('VU', 'Vanuatu', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('WF', 'Wallis,Futuna', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('WS', 'Samoa', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('YE', 'Yemen', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('YT', 'Mayotte', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ZA', 'South Africa', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ZM', 'Zambia', 0)
    INSERT INTO Countries([Code], [Name], [Deleted]) VALUES('ZW', 'Zimbabwe', 0)
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803100848_FillCountries')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220803100848_FillCountries', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220809085940_Modified_User')
BEGIN
    ALTER TABLE [Users] ADD [HasReceivedGuide] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220809085940_Modified_User')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220809085940_Modified_User', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811080942_Group')
BEGIN
    ALTER TABLE [Users] ADD [GroupId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811080942_Group')
BEGIN
    CREATE TABLE [Groups] (
        [Id] int NOT NULL IDENTITY,
        [Code] nvarchar(25) NOT NULL,
        [Name] nvarchar(256) NOT NULL,
        [RoleId] int NOT NULL,
        CONSTRAINT [PK_Groups] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Groups_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811080942_Group')
BEGIN
    CREATE INDEX [IX_Users_GroupId] ON [Users] ([GroupId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811080942_Group')
BEGIN
    CREATE INDEX [IX_Groups_RoleId] ON [Groups] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811080942_Group')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Groups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [Groups] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811080942_Group')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220811080942_Group', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811094305_GroupSoftDeleteAndCodeIndex')
BEGIN
    ALTER TABLE [Groups] ADD [Deleted] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811094305_GroupSoftDeleteAndCodeIndex')
BEGIN
    CREATE UNIQUE INDEX [IX_Groups_Code] ON [Groups] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220811094305_GroupSoftDeleteAndCodeIndex')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220811094305_GroupSoftDeleteAndCodeIndex', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220812120742_CategoryAndDocument')
BEGIN
    CREATE TABLE [Categories] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Categories] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220812120742_CategoryAndDocument')
BEGIN
    CREATE TABLE [Documents] (
        [Id] int NOT NULL IDENTITY,
        [File] nvarchar(max) NOT NULL,
        [CategoryId] int NOT NULL,
        CONSTRAINT [PK_Documents] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Documents_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220812120742_CategoryAndDocument')
BEGIN
    CREATE INDEX [IX_Documents_CategoryId] ON [Documents] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220812120742_CategoryAndDocument')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220812120742_CategoryAndDocument', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816083253_relation_OnDelete_DeleteBehavior_ClientSetNull')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Groups_GroupId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816083253_relation_OnDelete_DeleteBehavior_ClientSetNull')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Groups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [Groups] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816083253_relation_OnDelete_DeleteBehavior_ClientSetNull')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220816083253_relation_OnDelete_DeleteBehavior_ClientSetNull', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD [DefaultBehaviour] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD [DoGroupId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD [DoUserId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD [QcGroupId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD [QcUserId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    CREATE INDEX [IX_Companies_DoGroupId] ON [Companies] ([DoGroupId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    CREATE INDEX [IX_Companies_DoUserId] ON [Companies] ([DoUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    CREATE INDEX [IX_Companies_QcGroupId] ON [Companies] ([QcGroupId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    CREATE INDEX [IX_Companies_QcUserId] ON [Companies] ([QcUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD CONSTRAINT [FK_Companies_Groups_DoGroupId] FOREIGN KEY ([DoGroupId]) REFERENCES [Groups] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD CONSTRAINT [FK_Companies_Groups_QcGroupId] FOREIGN KEY ([QcGroupId]) REFERENCES [Groups] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD CONSTRAINT [FK_Companies_Users_DoUserId] FOREIGN KEY ([DoUserId]) REFERENCES [Users] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    ALTER TABLE [Companies] ADD CONSTRAINT [FK_Companies_Users_QcUserId] FOREIGN KEY ([QcUserId]) REFERENCES [Users] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816125734_CompanyCustomization')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220816125734_CompanyCustomization', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816131024_DefaultBehaviour_defaultValue')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220816131024_DefaultBehaviour_defaultValue', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816135843_DefaultBehavior_nameFix')
BEGIN
    EXEC sp_rename N'[Companies].[DefaultBehaviour]', N'DefaultBehavior', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220816135843_DefaultBehavior_nameFix')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220816135843_DefaultBehavior_nameFix', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD [DoGroupCheckerId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD [DoUserCheckerId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD [QcGroupCheckerId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD [QcUserCheckerId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    CREATE INDEX [IX_RowCertificates_DoGroupCheckerId] ON [RowCertificates] ([DoGroupCheckerId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    CREATE INDEX [IX_RowCertificates_DoUserCheckerId] ON [RowCertificates] ([DoUserCheckerId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    CREATE INDEX [IX_RowCertificates_QcGroupCheckerId] ON [RowCertificates] ([QcGroupCheckerId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    CREATE INDEX [IX_RowCertificates_QcUserCheckerId] ON [RowCertificates] ([QcUserCheckerId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Groups_DoGroupCheckerId] FOREIGN KEY ([DoGroupCheckerId]) REFERENCES [Groups] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Groups_QcGroupCheckerId] FOREIGN KEY ([QcGroupCheckerId]) REFERENCES [Groups] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Users_DoUserCheckerId] FOREIGN KEY ([DoUserCheckerId]) REFERENCES [Users] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Users_QcUserCheckerId] FOREIGN KEY ([QcUserCheckerId]) REFERENCES [Users] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817083455_RowCertificateCheckers')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220817083455_RowCertificateCheckers', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    ALTER TABLE [RowCertificates] DROP CONSTRAINT [FK_RowCertificates_Groups_DoGroupCheckerId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    ALTER TABLE [RowCertificates] DROP CONSTRAINT [FK_RowCertificates_Groups_QcGroupCheckerId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    ALTER TABLE [RowCertificates] DROP CONSTRAINT [FK_RowCertificates_Users_DoUserCheckerId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    ALTER TABLE [RowCertificates] DROP CONSTRAINT [FK_RowCertificates_Users_QcUserCheckerId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    DROP INDEX [IX_RowCertificates_DoGroupCheckerId] ON [RowCertificates];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    DROP INDEX [IX_RowCertificates_DoUserCheckerId] ON [RowCertificates];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    DECLARE @var63 sysname;
    SELECT @var63 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'DoGroupCheckerId');
    IF @var63 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var63 + '];');
    ALTER TABLE [RowCertificates] DROP COLUMN [DoGroupCheckerId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    DECLARE @var64 sysname;
    SELECT @var64 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'DoUserCheckerId');
    IF @var64 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var64 + '];');
    ALTER TABLE [RowCertificates] DROP COLUMN [DoUserCheckerId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    EXEC sp_rename N'[RowCertificates].[QcUserCheckerId]', N'CheckerUserId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    EXEC sp_rename N'[RowCertificates].[QcGroupCheckerId]', N'CheckerGroupId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    EXEC sp_rename N'[RowCertificates].[IX_RowCertificates_QcUserCheckerId]', N'IX_RowCertificates_CheckerUserId', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    EXEC sp_rename N'[RowCertificates].[IX_RowCertificates_QcGroupCheckerId]', N'IX_RowCertificates_CheckerGroupId', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Users_CheckerGroupId] FOREIGN KEY ([CheckerGroupId]) REFERENCES [Users] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Users_CheckerUserId] FOREIGN KEY ([CheckerUserId]) REFERENCES [Users] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084003_checkers-rework')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220817084003_checkers-rework', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084040_checkers-rework-fix')
BEGIN
    ALTER TABLE [RowCertificates] DROP CONSTRAINT [FK_RowCertificates_Users_CheckerGroupId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084040_checkers-rework-fix')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Groups_CheckerGroupId] FOREIGN KEY ([CheckerGroupId]) REFERENCES [Groups] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084040_checkers-rework-fix')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220817084040_checkers-rework-fix', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084731_UpdateCheckerUserId_SCRIPT')
BEGIN
    UPDATE DEST
                                SET
                                    CheckerUserId = u.Id
                            FROM RowCertificates DEST INNER JOIN Users u ON DEST.Checker = u.UPN
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220817084731_UpdateCheckerUserId_SCRIPT')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220817084731_UpdateCheckerUserId_SCRIPT', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220819123250_OrderTypeConfig')
BEGIN
    CREATE TABLE [OrderTypeConfig] (
        [Code] nvarchar(10) NOT NULL,
        [LabelMandatory] bit NULL,
        CONSTRAINT [PK_OrderTypeConfig] PRIMARY KEY ([Code])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220819123250_OrderTypeConfig')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220819123250_OrderTypeConfig', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220819123309_OrderTypeConfig_FILL')
BEGIN

                 INSERT INTO OrderTypeConfig (Code, LabelMandatory) SELECT 'Z3RD',1;
                 INSERT INTO OrderTypeConfig (Code, LabelMandatory) SELECT 'ZISO',1;
                 INSERT INTO OrderTypeConfig (Code, LabelMandatory) SELECT 'ZMRP',1;
                 INSERT INTO OrderTypeConfig (Code, LabelMandatory) SELECT 'ZSUB',1;
                 INSERT INTO OrderTypeConfig (Code, LabelMandatory) SELECT 'ZICY',1;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220819123309_OrderTypeConfig_FILL')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220819123309_OrderTypeConfig_FILL', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220824122141_DocumentsDmsId')
BEGIN
    ALTER TABLE [Documents] ADD [DmsId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220824122141_DocumentsDmsId')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220824122141_DocumentsDmsId', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220906085800_OrderBuyerVerifCode')
BEGIN
    DROP INDEX [IX_RowCertificates_VerificationReasonCode] ON [RowCertificates];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220906085800_OrderBuyerVerifCode')
BEGIN
    DECLARE @var65 sysname;
    SELECT @var65 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'VerificationReasonCode');
    IF @var65 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var65 + '];');
    ALTER TABLE [RowCertificates] DROP COLUMN [VerificationReasonCode];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220906085800_OrderBuyerVerifCode')
BEGIN
    ALTER TABLE [RowCertificates] ADD [VerificationReasonId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220906085800_OrderBuyerVerifCode')
BEGIN
    CREATE INDEX [IX_RowCertificates_VerificationReasonId] ON [RowCertificates] ([VerificationReasonId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220906085800_OrderBuyerVerifCode')
BEGIN
    ALTER TABLE [RowCertificates] ADD CONSTRAINT [FK_RowCertificates_Reasons_VerificationReasonId] FOREIGN KEY ([VerificationReasonId]) REFERENCES [Reasons] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220906085800_OrderBuyerVerifCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220906085800_OrderBuyerVerifCode', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907132359_VerificationReasonCodeCertificate')
BEGIN
    ALTER TABLE [RowCertificates] ADD [VerificationReasonCode] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907132359_VerificationReasonCodeCertificate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220907132359_VerificationReasonCodeCertificate', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220908100222_Added_HasSupplierSeeThisOrder_field')
BEGIN
    ALTER TABLE [Orders] ADD [HasSupplierSeeThisOrder] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220908100222_Added_HasSupplierSeeThisOrder_field')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220908100222_Added_HasSupplierSeeThisOrder_field', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220912084000_OrderCompNameFields')
BEGIN
    ALTER TABLE [Orders] ADD [CompanyNameId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220912084000_OrderCompNameFields')
BEGIN
    CREATE INDEX [IX_Orders_CompanyNameId] ON [Orders] ([CompanyNameId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220912084000_OrderCompNameFields')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_Companies_CompanyNameId] FOREIGN KEY ([CompanyNameId]) REFERENCES [Companies] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220912084000_OrderCompNameFields')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220912084000_OrderCompNameFields', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220914091336_UpdateCompanyNaming')
BEGIN
    ALTER TABLE [Orders] DROP CONSTRAINT [FK_Orders_Companies_CompanyNameId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220914091336_UpdateCompanyNaming')
BEGIN
    EXEC sp_rename N'[Orders].[CompanyNameId]', N'CompanyId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220914091336_UpdateCompanyNaming')
BEGIN
    EXEC sp_rename N'[Orders].[IX_Orders_CompanyNameId]', N'IX_Orders_CompanyId', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220914091336_UpdateCompanyNaming')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220914091336_UpdateCompanyNaming')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220914091336_UpdateCompanyNaming', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220919123109_AddOrdersDescriptions')
BEGIN
    ALTER TABLE [Orders] ADD [ModeOfTransportationDescription] nvarchar(20) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220919123109_AddOrdersDescriptions')
BEGIN
    ALTER TABLE [Orders] ADD [PaymentModeDescription] nvarchar(30) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220919123109_AddOrdersDescriptions')
BEGIN
    ALTER TABLE [Orders] ADD [PaymentTermsDescription] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220919123109_AddOrdersDescriptions')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220919123109_AddOrdersDescriptions', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221003070931_QtyReceivedDeliveryCompFields')
BEGIN
    ALTER TABLE [OrderRows] ADD [DeliveryCompleted] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221003070931_QtyReceivedDeliveryCompFields')
BEGIN
    ALTER TABLE [OrderRows] ADD [QuantityReceived] decimal(18,2) NOT NULL DEFAULT 0.0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221003070931_QtyReceivedDeliveryCompFields')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221003070931_QtyReceivedDeliveryCompFields', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026072356_AddOrderSyncDate')
BEGIN
    ALTER TABLE [Orders] ADD [SyncDate] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026072356_AddOrderSyncDate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221026072356_AddOrderSyncDate', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    DROP INDEX [IX_RowCertificates_Status] ON [RowCertificates];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    DROP INDEX [IX_Orders_CompanyCode] ON [Orders];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    DECLARE @var66 sysname;
    SELECT @var66 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'DisplayName');
    IF @var66 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var66 + '];');
    ALTER TABLE [Users] ALTER COLUMN [DisplayName] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    DECLARE @var67 sysname;
    SELECT @var67 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Companies]') AND [c].[name] = N'Description');
    IF @var67 IS NOT NULL EXEC(N'ALTER TABLE [Companies] DROP CONSTRAINT [' + @var67 + '];');
    ALTER TABLE [Companies] ALTER COLUMN [Description] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE UNIQUE INDEX [IX_Users_DisplayName] ON [Users] ([DisplayName]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_RowCertificates_CertificateType] ON [RowCertificates] ([CertificateType]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_RowCertificates_Component] ON [RowCertificates] ([Component]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_RowCertificates_DocumentType] ON [RowCertificates] ([DocumentType]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_RowCertificates_Status] ON [RowCertificates] ([Status]) INCLUDE ([OrderRowId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_Orders_Currency] ON [Orders] ([Currency]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_Orders_TotalAmount] ON [Orders] ([TotalAmount]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_OrderRows_Item] ON [OrderRows] ([Item]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_OrderRows_ItemStatus] ON [OrderRows] ([ItemStatus]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_OrderRows_Quantity] ON [OrderRows] ([Quantity]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_OrderRows_SupplyDescription] ON [OrderRows] ([SupplyDescription]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE INDEX [IX_OrderRows_TotalAmount] ON [OrderRows] ([TotalAmount]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE UNIQUE INDEX [IX_Groups_Name] ON [Groups] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    CREATE UNIQUE INDEX [IX_Companies_Description] ON [Companies] ([Description]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221026110144_IndexesOptimisation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221026110144_IndexesOptimisation', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221216141242_ChangeSyncDateToSendDate')
BEGIN
    EXEC sp_rename N'[Orders].[SyncDate]', N'SendDate', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221216141242_ChangeSyncDateToSendDate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221216141242_ChangeSyncDateToSendDate', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221227155641_DeliveryCompleted_QuantityReceived_fix')
BEGIN
    DECLARE @var68 sysname;
    SELECT @var68 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'QuantityReceived');
    IF @var68 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var68 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [QuantityReceived] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221227155641_DeliveryCompleted_QuantityReceived_fix')
BEGIN
    DECLARE @var69 sysname;
    SELECT @var69 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'DeliveryCompleted');
    IF @var69 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var69 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [DeliveryCompleted] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221227155641_DeliveryCompleted_QuantityReceived_fix')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221227155641_DeliveryCompleted_QuantityReceived_fix', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221230135510_OrderEmailRecipent')
BEGIN
    CREATE TABLE [Emails] (
        [Id] nvarchar(255) NOT NULL,
        [ConversationId] nvarchar(255) NULL,
        [InternetMessageId] nvarchar(255) NULL,
        [OrderId] bigint NULL,
        CONSTRAINT [PK_Emails] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Emails_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221230135510_OrderEmailRecipent')
BEGIN
    CREATE TABLE [EmailRecipents] (
        [Id] int NOT NULL IDENTITY,
        [Email] nvarchar(255) NOT NULL,
        [Undelivered] bit NULL,
        [EmailId] nvarchar(255) NULL,
        CONSTRAINT [PK_EmailRecipents] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_EmailRecipents_Emails_EmailId] FOREIGN KEY ([EmailId]) REFERENCES [Emails] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221230135510_OrderEmailRecipent')
BEGIN
    CREATE INDEX [IX_EmailRecipents_EmailId] ON [EmailRecipents] ([EmailId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221230135510_OrderEmailRecipent')
BEGIN
    CREATE INDEX [IX_Emails_OrderId] ON [Emails] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221230135510_OrderEmailRecipent')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221230135510_OrderEmailRecipent', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230102110650_N-N_OrdersEmails')
BEGIN
    ALTER TABLE [Emails] DROP CONSTRAINT [FK_Emails_Orders_OrderId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230102110650_N-N_OrdersEmails')
BEGIN
    DROP INDEX [IX_Emails_OrderId] ON [Emails];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230102110650_N-N_OrdersEmails')
BEGIN
    CREATE TABLE [EmailOrder] (
        [EmailsId] nvarchar(255) NOT NULL,
        [OrdersId] bigint NOT NULL,
        CONSTRAINT [PK_EmailOrder] PRIMARY KEY ([EmailsId], [OrdersId]),
        CONSTRAINT [FK_EmailOrder_Emails_EmailsId] FOREIGN KEY ([EmailsId]) REFERENCES [Emails] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_EmailOrder_Orders_OrdersId] FOREIGN KEY ([OrdersId]) REFERENCES [Orders] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230102110650_N-N_OrdersEmails')
BEGIN
    CREATE INDEX [IX_EmailOrder_OrdersId] ON [EmailOrder] ([OrdersId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230102110650_N-N_OrdersEmails')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230102110650_N-N_OrdersEmails', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230103160856_remove_Email_OrderId_column')
BEGIN
    DECLARE @var70 sysname;
    SELECT @var70 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Emails]') AND [c].[name] = N'OrderId');
    IF @var70 IS NOT NULL EXEC(N'ALTER TABLE [Emails] DROP CONSTRAINT [' + @var70 + '];');
    ALTER TABLE [Emails] DROP COLUMN [OrderId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230103160856_remove_Email_OrderId_column')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230103160856_remove_Email_OrderId_column', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230103163038_Email_SentDateTime')
BEGIN
    ALTER TABLE [Emails] ADD [SentDateTime] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230103163038_Email_SentDateTime')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230103163038_Email_SentDateTime', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230104161635_tables-rename-EmailRecipients')
BEGIN
    DROP TABLE [EmailRecipents];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230104161635_tables-rename-EmailRecipients')
BEGIN
    CREATE TABLE [EmailRecipients] (
        [Id] int NOT NULL IDENTITY,
        [Email] nvarchar(255) NOT NULL,
        [Undelivered] bit NULL,
        [EmailId] nvarchar(255) NULL,
        CONSTRAINT [PK_EmailRecipients] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_EmailRecipients_Emails_EmailId] FOREIGN KEY ([EmailId]) REFERENCES [Emails] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230104161635_tables-rename-EmailRecipients')
BEGIN
    CREATE INDEX [IX_EmailRecipients_EmailId] ON [EmailRecipients] ([EmailId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230104161635_tables-rename-EmailRecipients')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230104161635_tables-rename-EmailRecipients', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230120135539_ChangeQtyReceivedType')
BEGIN
    DECLARE @var71 sysname;
    SELECT @var71 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'QuantityReceived');
    IF @var71 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var71 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [QuantityReceived] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230120135539_ChangeQtyReceivedType')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230120135539_ChangeQtyReceivedType', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230123153538_AddManagerRoleId')
BEGIN
    ALTER TABLE [Groups] ADD [ManagerRoleId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230123153538_AddManagerRoleId')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230123153538_AddManagerRoleId', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230208084919_AddedSendDateIndex')
BEGIN
    CREATE INDEX [IX_Orders_SendDate] ON [Orders] ([SendDate]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230208084919_AddedSendDateIndex')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230208084919_AddedSendDateIndex', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230313102223_OrderSource')
BEGIN
    ALTER TABLE [Orders] ADD [Source] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230313102223_OrderSource')
BEGIN
    UPDATE Orders SET Source = 1
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230313102223_OrderSource')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230313102223_OrderSource', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315112302_OrderUniqueByOrderNumberAndSource')
BEGIN
    DROP INDEX [IX_Orders_OrderNumber] ON [Orders];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315112302_OrderUniqueByOrderNumberAndSource')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_Orders_OrderNumber_Source] ON [Orders] ([OrderNumber], [Source]) WHERE [Source] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315112302_OrderUniqueByOrderNumberAndSource')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230315112302_OrderUniqueByOrderNumberAndSource', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230320095934_AttachmentSoftDelete')
BEGIN
    ALTER TABLE [Attachments] ADD [Deleted] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230320095934_AttachmentSoftDelete')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230320095934_AttachmentSoftDelete', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230411125813_AddedDocumentTypetoReason')
BEGIN
    ALTER TABLE [Reasons] ADD [DocumentType] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230411125813_AddedDocumentTypetoReason')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230411125813_AddedDocumentTypetoReason', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230502065242_UpdateCertificateTypeDescriptionLength')
BEGIN
    DECLARE @var72 sysname;
    SELECT @var72 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RowCertificates]') AND [c].[name] = N'CertificateTypeDescription');
    IF @var72 IS NOT NULL EXEC(N'ALTER TABLE [RowCertificates] DROP CONSTRAINT [' + @var72 + '];');
    ALTER TABLE [RowCertificates] ALTER COLUMN [CertificateTypeDescription] nvarchar(80) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230502065242_UpdateCertificateTypeDescriptionLength')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230502065242_UpdateCertificateTypeDescriptionLength', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230503112936_AddDmsIdIndex')
BEGIN
    CREATE INDEX [IX_Attachments_DmsId] ON [Attachments] ([DmsId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230503112936_AddDmsIdIndex')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230503112936_AddDmsIdIndex', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230515074631_AddInboundDeliveDateAndActualGrDate')
BEGIN
    ALTER TABLE [OrderRows] ADD [ActualGrDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230515074631_AddInboundDeliveDateAndActualGrDate')
BEGIN
    ALTER TABLE [OrderRows] ADD [InboundDelDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230515074631_AddInboundDeliveDateAndActualGrDate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230515074631_AddInboundDeliveDateAndActualGrDate', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230524081119_LogCleaning')
BEGIN

                    update logs set eventlog = replace(eventlog,''+CHAR(13)+CHAR(10)+'','') where eventLog like '%Danieli.Downstream.WebApp.Helpers.CertificateStatusUpdateSet%;'
                    update logs set eventlog = replace(eventlog,'New Data:','') where eventLog like '%Danieli.Downstream.WebApp.Helpers.CertificateStatusUpdateSet%;'
                    update logs set eventlog = replace(eventlog,'Danieli.Downstream.WebApp.Helpers.CertificateStatusUpdateSet','') where eventLog like '%Danieli.Downstream.WebApp.Helpers.CertificateStatusUpdateSet%;'
                    
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230524081119_LogCleaning')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230524081119_LogCleaning', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529162914_realignFromDvcpTest')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230529162914_realignFromDvcpTest', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529163126_MetYouCode2')
BEGIN
    ALTER TABLE [Users] ADD [MetYouCode] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529163126_MetYouCode2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230529163126_MetYouCode2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530072344_orderKeys3')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_Orders_OrderNumber_CompanyId_OrderType] ON [Orders] ([OrderNumber], [CompanyId], [OrderType]) WHERE [OrderNumber] IS NOT NULL AND [CompanyId] IS NOT NULL AND [OrderType] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530072344_orderKeys3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230530072344_orderKeys3', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530095806_ChangeReasonCodeLengthTo5')
BEGIN
    DROP INDEX [IX_Reasons_Code] ON [Reasons];
    DECLARE @var73 sysname;
    SELECT @var73 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Reasons]') AND [c].[name] = N'Code');
    IF @var73 IS NOT NULL EXEC(N'ALTER TABLE [Reasons] DROP CONSTRAINT [' + @var73 + '];');
    ALTER TABLE [Reasons] ALTER COLUMN [Code] nvarchar(5) NULL;
    EXEC(N'CREATE UNIQUE INDEX [IX_Reasons_Code] ON [Reasons] ([Code]) WHERE [Code] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530095806_ChangeReasonCodeLengthTo5')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230530095806_ChangeReasonCodeLengthTo5', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530141051_MetYouCodeString')
BEGIN
    DECLARE @var74 sysname;
    SELECT @var74 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'MetYouCode');
    IF @var74 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var74 + '];');
    ALTER TABLE [Users] ALTER COLUMN [MetYouCode] nvarchar(25) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530141051_MetYouCodeString')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230530141051_MetYouCodeString', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531064619_DisabledUniqueReasonCode')
BEGIN
    DROP INDEX [IX_Reasons_Code] ON [Reasons];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531064619_DisabledUniqueReasonCode')
BEGIN
    CREATE INDEX [IX_Reasons_Code] ON [Reasons] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531064619_DisabledUniqueReasonCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230531064619_DisabledUniqueReasonCode', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531142221_ReEnabledFields')
BEGIN
    ALTER TABLE [OrderRows] ADD [DestinationCountry] nvarchar(3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531142221_ReEnabledFields')
BEGIN
    ALTER TABLE [OrderRows] ADD [WBSelement] nvarchar(12) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531142221_ReEnabledFields')
BEGIN
    ALTER TABLE [OrderRows] ADD [WhiteListCountries] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531142221_ReEnabledFields')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230531142221_ReEnabledFields', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230801132813_AddIndexWBSElement')
BEGIN
    CREATE INDEX [IX_OrderRows_WBSelement] ON [OrderRows] ([WBSelement]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230801132813_AddIndexWBSElement')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230801132813_AddIndexWBSElement', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230801160541_removedNavigationFromReasonToCertificates')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230801160541_removedNavigationFromReasonToCertificates', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230914152436_DoubleEmailDataFIX')
BEGIN


                        DELETE Users WHERE UPN like ' %';

                        UPDATE Orders 
    	                    SET 
    		                    VendorContactCertificationManagement = REPLACE(VendorContactCertificationManagement,' ',''),
    		                    VendorContactPOConfirmation = REPLACE(VendorContactPOConfirmation,' ','');
                            
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230914152436_DoubleEmailDataFIX')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230914152436_DoubleEmailDataFIX', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005073837_User-LastExcelExtraction')
BEGIN
    ALTER TABLE [Users] ADD [LastExcelExtraction] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005073837_User-LastExcelExtraction')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231005073837_User-LastExcelExtraction', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017135259_UserInclusions')
BEGIN
    CREATE TABLE [UserInclusions] (
        [Id] int NOT NULL IDENTITY,
        [UserId] int NULL,
        [IncludedUserId] int NULL,
        [Approved] bit NULL,
        CONSTRAINT [PK_UserInclusions] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_UserInclusions_Users_IncludedUserId] FOREIGN KEY ([IncludedUserId]) REFERENCES [Users] ([Id]),
        CONSTRAINT [FK_UserInclusions_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017135259_UserInclusions')
BEGIN
    CREATE INDEX [IX_UserInclusions_IncludedUserId] ON [UserInclusions] ([IncludedUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017135259_UserInclusions')
BEGIN
    CREATE INDEX [IX_UserInclusions_UserId] ON [UserInclusions] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017135259_UserInclusions')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231017135259_UserInclusions', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023093455_InitPopup')
BEGIN
    CREATE TABLE [Popup] (
        [Id] int NOT NULL IDENTITY,
        [Title] nvarchar(450) NULL,
        [Description] nvarchar(450) NULL,
        [RefuseButtonText] nvarchar(max) NULL,
        [AcceptButtonText] nvarchar(max) NULL,
        [AcceptButtonLink] nvarchar(max) NULL,
        [RolesList] nvarchar(max) NULL,
        [PublishTime] datetime2 NOT NULL,
        [PopupCreatorId] int NULL,
        CONSTRAINT [PK_Popup] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Popup_Users_PopupCreatorId] FOREIGN KEY ([PopupCreatorId]) REFERENCES [Users] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023093455_InitPopup')
BEGIN
    CREATE TABLE [PopupRole] (
        [PopupsId] int NOT NULL,
        [RolesId] int NOT NULL,
        CONSTRAINT [PK_PopupRole] PRIMARY KEY ([PopupsId], [RolesId]),
        CONSTRAINT [FK_PopupRole_Popup_PopupsId] FOREIGN KEY ([PopupsId]) REFERENCES [Popup] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_PopupRole_Roles_RolesId] FOREIGN KEY ([RolesId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023093455_InitPopup')
BEGIN
    CREATE INDEX [IX_Popup_Description] ON [Popup] ([Description]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023093455_InitPopup')
BEGIN
    CREATE INDEX [IX_Popup_PopupCreatorId] ON [Popup] ([PopupCreatorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023093455_InitPopup')
BEGIN
    CREATE INDEX [IX_Popup_Title] ON [Popup] ([Title]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023093455_InitPopup')
BEGIN
    CREATE INDEX [IX_PopupRole_RolesId] ON [PopupRole] ([RolesId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023093455_InitPopup')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231023093455_InitPopup', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023134533_HasActiveItems')
BEGIN
    ALTER TABLE [Users] ADD [HasActiveItems] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231023134533_HasActiveItems')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231023134533_HasActiveItems', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231024123625_AddHasSeenUpdate')
BEGIN
    ALTER TABLE [Users] ADD [HasSeenUpdate] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231024123625_AddHasSeenUpdate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231024123625_AddHasSeenUpdate', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231108080810_NewSupplierRoles')
BEGIN


                SET IDENTITY_INSERT Roles ON

                INSERT INTO Roles ([Id],[Name],[Description])
                SELECT 15, 'SupplierCommercial', 'Supplier Commercial'
                UNION
                SELECT 16, 'SupplierLogistic', 'Supplier Logistic'
                
                SET IDENTITY_INSERT Roles OFF

END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231108080810_NewSupplierRoles')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231108080810_NewSupplierRoles', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231108104839_AddDocumentTypeToDocumentsTable')
BEGIN
    ALTER TABLE [Documents] ADD [DocumentType] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231108104839_AddDocumentTypeToDocumentsTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231108104839_AddDocumentTypeToDocumentsTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231110083753_SqlObjectForDevelopers')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231110083753_SqlObjectForDevelopers', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231117154451_BlackListEmails')
BEGIN
    CREATE TABLE [BlackListEmails] (
        [Id] int NOT NULL IDENTITY,
        [Email] nvarchar(255) NULL,
        CONSTRAINT [PK_BlackListEmails] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231117154451_BlackListEmails')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231117154451_BlackListEmails', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231122152154_DestinationCountry_30char')
BEGIN
    DECLARE @var75 sysname;
    SELECT @var75 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderRows]') AND [c].[name] = N'DestinationCountry');
    IF @var75 IS NOT NULL EXEC(N'ALTER TABLE [OrderRows] DROP CONSTRAINT [' + @var75 + '];');
    ALTER TABLE [OrderRows] ALTER COLUMN [DestinationCountry] nvarchar(30) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231122152154_DestinationCountry_30char')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231122152154_DestinationCountry_30char', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    ALTER TABLE [Logs] ADD [OrderId] bigint NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    ALTER TABLE [Logs] ADD [OrderRowId] bigint NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    ALTER TABLE [Logs] ADD [RowCertificateId] bigint NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    CREATE INDEX [IX_Logs_OrderId] ON [Logs] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    CREATE INDEX [IX_Logs_OrderId_OrderRowId_RowCertificateId] ON [Logs] ([OrderId], [OrderRowId], [RowCertificateId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    CREATE INDEX [IX_Logs_OrderRowId] ON [Logs] ([OrderRowId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    CREATE INDEX [IX_Logs_RowCertificateId] ON [Logs] ([RowCertificateId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128113821_LogsIndexes')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231128113821_LogsIndexes', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128133711_ConnectLogsAndCerts')
BEGIN
    ALTER TABLE [Logs] ADD CONSTRAINT [FK_Logs_OrderRows_OrderRowId] FOREIGN KEY ([OrderRowId]) REFERENCES [OrderRows] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128133711_ConnectLogsAndCerts')
BEGIN
    ALTER TABLE [Logs] ADD CONSTRAINT [FK_Logs_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128133711_ConnectLogsAndCerts')
BEGIN
    ALTER TABLE [Logs] ADD CONSTRAINT [FK_Logs_RowCertificates_RowCertificateId] FOREIGN KEY ([RowCertificateId]) REFERENCES [RowCertificates] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231128133711_ConnectLogsAndCerts')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231128133711_ConnectLogsAndCerts', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240312100834_REMOVE_INDEX_IX_Orders_OrderNumber_Source')
BEGIN
    DROP INDEX [IX_Orders_OrderNumber_Source] ON [Orders];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240312100834_REMOVE_INDEX_IX_Orders_OrderNumber_Source')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240312100834_REMOVE_INDEX_IX_Orders_OrderNumber_Source', N'6.0.5');
END;
GO

COMMIT;
GO

