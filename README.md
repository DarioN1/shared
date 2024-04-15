# shared
shared

https://DxxxxxICT-Apps@dev.azure.com/DanieliICT-Apps/DVCP/_git/DVCP

select uu.*, oo.*
from users uu
left join OtpAuthentications oo
on oo.UserId = uu.id
where RoleId in ( 3, 16)
and HasActiveItems = 1
and not exists (select 1 from EmailRecipients er
join emails ee
on ee.id = er.EmailId
where  er.Email = uu.upn
and ee.SentDateTime >= '20240414'
and ee.SentDateTime < '20240415'
)
and exists (
select 1
from orders 
where (CHARINDEX(uu.upn, VendorContactCertificationManagement,1) > 0
or CHARINDEX(uu.upn, VendorContactPOConfirmation,1) > 0)
and orders.SendDate < '20240413'
)


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
