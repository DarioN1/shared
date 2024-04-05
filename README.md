# shared
shared

https://DxxxxxICT-Apps@dev.azure.com/DanieliICT-Apps/DVCP/_git/DVCP

[{"Id":0,"OrderNumber":"24017009","CompanyCode":"CN60","Company":null,"CompanyId":null,"PurchasingOrganization":"CN60","OrderType":"OE","OrderStatus":1,"VendorCode":"183585","VendorDescription":"NANJING WOTIAN TECHNOLOGY CO. , LTD","VendorContactPOConfirmation":"po.confirmation@dvcp.com","VendorContactCertificationManagement":"pty0522@163.com","OrderDate":"2024-03-12T00:00:00","SendDate":"0001-01-01T00:00:00","Buyer":"f.wang@danieli.com","BuyerDisplayName":"WANG FEI","Expediter":"x.meng@danieli.com","ExpediterDisplayName":"MENG XIANGDONG","Currency":"CNY","TotalAmount":266371.69,"Incoterms":"CIP","IncotermsLocation":"1","ModeOfTransportation":null,"ModeOfTransportationDescription":null,"PaymentTerms":"E11","PaymentTermsDescription":null,"PaymentMode":"*","PaymentModeDescription":null,"HasSupplierSeeThisOrder":false,"Rows":[{"Id":0,"Item":1000,"ItemStatus":0,"CodeDWG":"DPC46M-FH31-M3400-SS016","OWRevisionLevel":"00","ItemWeight":0.0,"WeightUM":"KG","BOMPosition":null,"SupplyDescription":"MOISTURE TRANSMITTER","Plant":"CN60","StorageLocation":null,"MaterialGroup":"AXX","Quantity":1.0,"QuantityReceived":0.0,"DeliveryCompleted":null,"UM":"NR","TotalAmount":94690.27,"TaxCode":"V","DeliveryDate":"2024-04-19T00:00:00","CostCenter":"G367","WBSelement":"GPC46M014008","SONumber":null,"SOItem":null,"AssetNumber":null,"ExpectedDate":"2024-04-19T00:00:00","ETA":"2024-04-19T00:00:00","ReadyForDeliveryDate":null,"AccountAssignmentCategory":null,"ItemCategory":null,"CountryRestriction":null,"WhiteListCountries":null,"DestinationCountry":"RUSSIA","InboundDelDate":null,"ActualGrDate":null,"HasBill":false,"OrderId":0,"Order":null,"RowCertificates":[{"Id":0,"Component":"DPC46M-FH31-M3400-SS016","DocumentType":"DO","CertificateType":"PREFRES","CertificateTypeDescription":"Pref. Origin-Country Restr.","HPFlag":null,"REParameter":null,"Status":0,"ReceiptDate":null,"Checker":"x.meng@danieli.com","CheckerUserId":null,"CheckerUser":null,"CheckerGroupId":null,"CheckerGroup":null,"CheckerDisplayName":null,"VerificationReasonCode":null,"VerificationReason":null,"VerificationReasonId":null,"CertificationDate":null,"CountryOfOrigin":null,"Notes":null,"OrderRowId":0,"OrderRow":null,"Attachments":null,"Logs":null,"LastModified":"0001-01-01T00:00:00"}],"Attachments":null,"Logs":null,"LastModified":"0001-01-01T00:00:00"}],"Attachments":null,"Logs":null,"Emails":null,"Source":2,"LastModified":"0001-01-01T00:00:00"}]

SELECT *
FROM USERS    uu
where roleid = 16
and HasActiveItems > 0
and exists (
select *
from RowCertificates rc
join OrderRows od 
on od.id = rc.OrderRowId
join orders po
on po.id = od.OrderId
and charindex (trim(uu.upn),po.VendorContactCertificationManagement,1) > 0
and rc.Status = 0
and po.CompanyCode = 'CN60'
)
and not exists (
select *
from EmailRecipients er
join emails em 
on em.Id = er.EmailId
where email = uu.upn
and SentDateTime > '20240317'
)
