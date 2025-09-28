$cert = New-SelfSignedCertificate -Subject "AlwaysEncryptedCert" -CertStoreLocation Cert:\CurrentUser\My -KeyExportPolicy Exportable -Type DocumentEncryptionCert -KeyUsage KeyEncipherment -KeySpec KeyExchange -KeyLength 2048

Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object {$_.Subject -like "*AlwaysEncryptedCert*"} | Select-Object Thumbprint,Subject



