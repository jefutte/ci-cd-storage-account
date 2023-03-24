param location string = resourceGroup().location
param storageAccountName string
param fileShareName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
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

resource service 'Microsoft.Storage/storageAccounts/fileServices@2021-02-01' = {
  parent: storageAccount
  name: 'default'
}


resource fileShare 'Microsoft.Storage/storageAccounts/fileServices/shares@2022-09-01' = {
  parent: service
  name: fileShareName
  properties: {
    enabledProtocols: 'SMB'
  }
}
