USE [Downstream]
GO

DELETE FROM EmailTemplateParameters
DBCC CHECKIDENT ('dbo.EmailTemplateParameters', RESEED, 0)

DELETE FROM EmailTemplates
DBCC CHECKIDENT ('dbo.EmailTemplates', RESEED, 0)

DECLARE @EmailTemplateId as int;

-- SyncAddOrUpdateOrder - 0

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (0, 'Danieli - Added/Updated Orders', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Added/Updated Order Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr class="table-container-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear Sirs,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of newly added/updated orders in charge of you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Rows Count</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificates Count</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Orders}
                    </tbody>
                  </table>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply
                    to this automatic e-mail. </p>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
                </div>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Rows}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{RowCertificates}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a></td>
</tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- OrderBuyerChanged - 1

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (1, 'Danieli - Orders'' Buyer changed', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Order Buyer Changed Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">{DisplayName}</span>,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of purchase orders in charge of you as a <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">Buyer</span>:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Rows Count</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificates Count</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Orders}
                    </tbody>
                  </table>
                </div>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply
                  to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Rows}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{RowCertificates}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')

SET @EmailTemplateId = 0;

-- OrderExpediterChanged - 2

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (2, 'Danieli - Orders'' Expediter changed', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Order Expediter Changed Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  

  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">{DisplayName}</span>,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of purchase orders in charge of you as an <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">Expediter</span>:</p>
                <table class="table padding-vertical" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;padding-top: 16px;padding-bottom: 16px;">
                  <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                    <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Rows Count</th>
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificates Count</th>
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                    </tr>
                  </thead>
                  <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                    {Orders}
                  </tbody>
                </table>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply
                  to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Rows}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{RowCertificates}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')

SET @EmailTemplateId = 0;

-- CertificateApproval - 3

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (3, 'Danieli - Certificates'' Approval', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Certificates Approved Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear Sirs,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">approved</span> certificates in charge of you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificate</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Certificates}
                    </tbody>
                    <tfoot class="table-foot" style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
                  </table>
                </div>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply to this automatic e-mail. To log in to the application, use this <a class="text-underlined" href="{Link}" style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;">link</a>.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Certificates}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Component}-{CertificateType}-{DocumentType}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{CertificateLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
		      ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
		   ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- CertificateRejection - 4

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (4, 'Danieli - Certificates'' Rejection', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Certificates Rejected Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear Sirs,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">rejected</span> certificates in charge of you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificate</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Certificates}
                    </tbody>
                  </table>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply
                    to this automatic e-mail.</p>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </div></td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as
    possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Certificates}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Component}-{CertificateType}-{DocumentType}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{CertificateLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- CertificateCheckerChanged - 5

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (5, 'Danieli - Certificates'' Checker changed', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Certificate Checker Changed Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">{DisplayName}</span>,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">the verification of the following certificate has been assigned to you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificate</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Certificates}
                    </tbody>
                  </table>
                </div>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Certificates}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Component}-{CertificateType}-{DocumentType}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{CertificateLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- PeriodicalUpdate - 6

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (6, 'Danieli - Periodical Update', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Periodical Update Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>


<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear {DisplayName},</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of purchase orders in charge of you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Rows Count</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificates Count</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Orders}
                    </tbody>
                  </table>
                </div>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply
                    to this automatic e-mail.</p>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
                
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>

</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Rows}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{RowCertificates}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a  style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'To log in to the application, use this <a style="text-decoration: underline" href="{Link}">link</a>'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- UserOTP - 7

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (7, 'Danieli - Sign In OTP', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">DVCP - Sign In</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear Sirs,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">you can find your <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">OTP code</span> below:</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p style="margin: 0;box-sizing: border-box;font-weight: normal;"><span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">{OTP}</span></p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">To login to Danieli Vendor Collaboration Platform,
                  use this <a class="text-underlined" href="{Link}" style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;">link</a>. Do not reply to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon
    as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{OTP}'
           ,'{OTP}'
           ,0
           ,@EmailTemplateId
           ,'')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')

SET @EmailTemplateId = 0;

-- OrderSupplierConfirmation - 8

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (8, 'Danieli - Orders confirmation', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Order Confirmed Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  

  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">{DisplayName}</span>,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">confirmed</span> orders in charge of
                  you:</p>
                <table class="table padding-vertical" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;padding-top: 16px;padding-bottom: 16px;">
                  <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                    <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Rows Count</th>
                      <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificates Count</th>
                      <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                    </tr>
                  </thead>
                  <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                    {Orders}
                  </tbody>
                </table>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply
                  to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon
    as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Rows}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{RowCertificates}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId)

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')

SET @EmailTemplateId = 0;

-- CertificateSupplierSubmission - 9

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (9, 'Danieli - Certificates submission', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Certificates Submitted Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">{DisplayName}</span>,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of certificates to be <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">verified</span> in charge of you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificate</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Certificates}
                    </tbody>
                    <tfoot class="table-foot" style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
                  </table>
                </div>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Certificates}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Component}-{CertificateType}-{DocumentType}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{CertificateLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- Debug - 10

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (10, 'Danieli - Debug', 
'<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">DVCP - Debug</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear user,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is an email to check wether the <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">email provider is working or not</span>.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon
    as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Certificates}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Component}-{CertificateType}-{DocumentType}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{CertificateLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- Order Attachments Forward - 11

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (11, 'Danieli - Forward Orders', 
'<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Added/Updated Order Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr class="table-container-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear Sirs,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">as attachments to this email, you find the documents related to the following order, in charge of you:<br><br></p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Orders}
                    </tbody>
                  </table>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">
                  To follow up the order in Danieli Vendor Collaboration Platform you can log in to the application via the "Open" link.
                  <br>
                  Please do not reply to this automatic e-mail.
                  </p>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
                </div>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a>
</td></tr>'
           ,11
           ,@EmailTemplateId
           ,'')
           
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sir')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- Send Certificates To Be Submitted - 12

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (12, 'Danieli - Certificates To Be Submitted', 
'<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Certificate Checker Changed Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear Sirs,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">This is the list of required documents to be provided in charge of you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificate number</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Certificates}
                    </tbody>
                  </table>
				</div>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please login to Danieli Vendor Collaboration Platform to see them, do not reply to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Certificates}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Component}-{CertificateType}-{DocumentType}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{CertificateLink}">Open</a>
</td></tr>'
           ,1
           ,@EmailTemplateId
           ,'')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- Sync Order Cancelled - 13

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (13, 'Danieli - Orders Cancelled', 
'<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
    <title style="margin: 0;box-sizing: border-box;">Canceled Order Email</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">

    <!--[if mso]>
      <style type="text/css">
      table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
      div, td {padding:0;}
      div {margin:0 !important;}
      </style>
    <noscript>
      <xml>
        <o:OfficeDocumentSettings>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
      </xml>
    </noscript>
    <![endif]-->
    <!--[if gte mso 9]>
    <xml>
    <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
    </xml>
    <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
        <tr class="table-container-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
            <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
                <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
                        <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
                            <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
                        </tr>
                        <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                            <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
                            </th>
                        </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                        <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                            <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear  <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold">{DisplayName}</span>,</p>
                                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of orders in charge of you has been <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;color:red">CANCELED:</span></p>
                                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                                    <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                                        <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                                            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                                                <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                                                <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
                                                <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Rows Count</th>
                                                <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificates Count</th>
                                                <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                                            {Orders}
                                        </tbody>
                                    </table>
                                    <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                                    <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">
                                        Please contact your reference buyer for further information.
                                    </p>
                                    <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                                    <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                                    <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
                </table>
            </td>
            <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
        </tr>
    </table>
    <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">
        If you have received this message by mistake, please notify the sender as soon as possible
        by e-mail and destroy this message.
    </p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Rows}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{RowCertificates}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a></td>
</tr>'
           ,1
           ,@EmailTemplateId
           ,'')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- Sync Cancel Row - 14

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (14, 'Danieli - Rows Cancelled', 
'<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Rows Canceled Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear Sirs,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;color: red;">CANCELED </span> rows in charge of you:</p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Status</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Row Item</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Row status</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Rows}
                    </tbody>
                    <tfoot class="table-foot" style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
                  </table>
                </div>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Rows}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
    <td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
    <td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
    <td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{Item}</td>
    <td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{ItemStatus}</td>
    <td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
    <a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{RowLink}">Open</a></td>
    </tr>'
           ,1
           ,@EmailTemplateId
           ,'')
		   
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;

-- CertificatePeriodicalEmail - 15

INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (15, 'Danieli - Certificates periodical mail', 
           '<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Certificates Submitted Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear <span class="text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;">{DisplayName}</span>,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">{Action}</p>
                
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please <a class="text-underlined" href="{Link}" style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;">login</a> to Danieli Vendor Collaboration Platform to see them, do not reply to this automatic e-mail.</p>
                <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();


INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sirs')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Action}'
           ,'{Action}'
           ,0
           ,@EmailTemplateId
           ,'Action')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;


INSERT INTO [dbo].[EmailTemplates]
           ([Type], [Subject],
            [Body])
     VALUES
           (16, 'Danieli - Periodical Orders ToBeConfirmed', 
'<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="margin: 0;box-sizing: border-box;">

<head style="margin: 0;box-sizing: border-box;">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" style="margin: 0;box-sizing: border-box;">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;box-sizing: border-box;">
  <title style="margin: 0;box-sizing: border-box;">Periodical Orders ToBeConfirmed Email</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" style="margin: 0;box-sizing: border-box;">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin style="margin: 0;box-sizing: border-box;">
  
  <!--[if mso]>
	<style type="text/css">
    table {border-collapse:collapse;border:0;border-spacing:0;margin:0;}
    div, td {padding:0;}
    div {margin:0 !important;}
	</style>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->

  

  <!--[if gte mso 9]>
  <xml>
  <o:OfficeDocumentSettings>
  <o:AllowPNG/>
  <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
</head>

<body style="margin: 0;box-sizing: border-box;background: #f5f5f7;background-repeat: no-repeat;font-family: ''Roboto'', sans-serif;padding: 16px 0;">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table-container" style="margin: 0;box-sizing: border-box;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
    <tr class="table-container-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
      <td width="640" class="table-main-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 640.0pt;padding: 0in 0in 0in 0in;">
        <table class="table-card" rules="none" style="margin: 0 auto;box-sizing: border-box;font-weight: normal;width: 100%;background: #ffffff;border: 1px solid #e9e9ed;">
          <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;">
            <tr class="table-row table-border" style="margin: 0;box-sizing: border-box;font-weight: normal;height: 8px;background: #3d5151;">
              <th style="margin: 0;box-sizing: border-box;font-weight: normal;"></th>
            </tr>
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <th class="table-cell padding-vertical border-bottom" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;border-bottom: 1px solid #e9e9ed;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Danieli_flag.jpg" width="80" height="45" alt="danieli logo" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 80px;">
              </th>
            </tr>
          </thead>
          <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
            <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;">
              <td class="table-column padding-vertical padding-horizontal" style="margin: 0;box-sizing: border-box;font-weight: normal;padding-top: 16px;padding-bottom: 16px;padding-left: 16px;padding-right: 16px;">
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Dear {DisplayName},</p>
                <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">this is the list of <b>NOT CONFIRMED</b> orders in charge of you:<br><br></p>
                <div class="table-container" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100.0%;border-collapse: collapse;padding: 0in 0in 0in 0in;">
                  <table class="table" rules="none" style="margin: 0;box-sizing: border-box;font-weight: normal;width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <thead class="table-header" style="margin: 0;box-sizing: border-box;font-weight: normal;border-bottom: 1px solid #e9e9ed;background: #e9e9ed;">
                      <tr class="table-row" style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Order Number</th>
                        <th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Status</th>
						<th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Row Count</th>
						<th class="table-column text-bold" style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">Certificates Count</th>
                        <th class="table-column" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 4px 8px;white-space: nowrap;text-align: center;"></th>
                      </tr>
                    </thead>
                    <tbody class="table-body" style="margin: 0;box-sizing: border-box;font-weight: normal;">
                      {Orders}
                    </tbody>
                  </table>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Please <a class="text-underlined" href="{Link}" style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;">login</a> to Danieli Vendor Collaboration Platform to see and confirm them, do not reply to this automatic e-mail.</p>
                  <br style="margin: 0;box-sizing: border-box;font-weight: normal;">
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Best regards,</p>
                  <p class="text-italic" style="margin: 0;box-sizing: border-box;font-weight: normal;font-style: italic;">Danieli Team</p>
                </div>
              </td>
            </tr>
          </tbody>
          <tfoot style="margin: 0;box-sizing: border-box;font-weight: normal;"></tfoot>
        </table>
      </td>
      <td class="table-side-cell" style="margin: 0;box-sizing: border-box;font-weight: normal;padding: 0in 0in 0in 0in;"></td>
    </tr>
  </table>
  <p class="text-italic disclaimer-text" style="margin: 16px auto;box-sizing: border-box;display: block;padding: 0 16px;font-size: 12px;color: #6e6e73;text-align: center;font-style: italic;">If you have received this message by mistake, please notify the sender as soon as possible
    by e-mail and destroy this message.</p>
</body>

</html>')

SET @EmailTemplateId = SCOPE_IDENTITY();

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Orders}'
           ,'<tr style="margin: 0;box-sizing: border-box;font-weight: normal;border: 1px solid #e9e9ed;">
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderNumber}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{OrderStatus}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{RowCount}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">{CertificateCount}</td>
<td style="margin: 0;box-sizing: border-box;font-weight: bold;padding: 4px 8px;white-space: nowrap;text-align: center;">
<a style="margin: 0;box-sizing: border-box;font-weight: normal;text-decoration: underline;" href="{OrderLink}">Open</a>
</td></tr>'
           ,16
           ,@EmailTemplateId
           ,'')
           
INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{DisplayName}'
           ,'{DisplayName}'
           ,0
           ,@EmailTemplateId
           ,'Sir')

INSERT INTO [dbo].[EmailTemplateParameters]
           ([Name]
           ,[Body]
           ,[ContainsSingleValue]
           ,[EmailTemplateId]
           ,[DefaultValue])
     VALUES
           ('{Link}'
           ,'{Link}'
           ,0
           ,@EmailTemplateId
           ,'')

SET @EmailTemplateId = 0;
