# shared
shared

https://DxxxxxICT-Apps@dev.azure.com/DanieliICT-Apps/DVCP/_git/DVCP

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
