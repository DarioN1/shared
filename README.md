# shared
shared

https://DxxxxxICT-Apps@dev.azure.com/DanieliICT-Apps/DVCP/_git/DVCP

select *
from Attachments aa
join RowCertificates rc
on aa.RowCertificateId is not null
and aa.RowCertificateId = rc.Id
join OrderRows od
on od.id = rc.OrderRowId
join Orders	po
on po.id = od.OrderId
where po.Source = 2
and po.OrderNumber = '22775430'
