@description('Nombre del appservice')
@minLength(2)
param webAppName string = 'webApp-${uniqueString(resourceGroup().id)}'

@description('Ubicacion')
param location string = 'East US'

@description('SKU gratuito')
param sku string = 'F1'

@description('stack por defecto')
param linuxFxVersion string = 'DOTNETCORE|3.0'

@description('GIT repo del serviceplan')
param repoUrl string = ' '

var appServicePlanPortalName = 'bootcampsp'

resource appServicePlanPortal 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanPortalName
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appservice1bootcampacs 'Microsoft.Web/sites@2021-02-01' = {
  name: 'appservice1bootcampacs'
  location: location
  properties: {
    httpsOnly: true
    serverFarmId: appServicePlanPortal.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      minTlsVersion: '1.2'
      ftpsState: 'FtpsOnly'
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}

resource appservice2bootcampacs 'Microsoft.Web/sites@2021-02-01' = {
  name: 'appservice2bootcampacs'
  location: location
  properties: {
    httpsOnly: true
    serverFarmId: appServicePlanPortal.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      minTlsVersion: '1.2'
      ftpsState: 'FtpsOnly'
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}