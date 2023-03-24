param location string = resourceGroup().location
param storageAccountName string
param fileShareName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    enableHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
    }
  }
}

resource fileShare 'Microsoft.Storage/storageAccounts/fileServices/shares@2021-06-01' = {
  name: '${storageAccount.name}/default/${fileShareName}'
  properties: {
    enabledProtocol: 'SMB'
  }
}
