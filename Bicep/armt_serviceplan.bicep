param name string
param location string
param sku string
param skucode string
param workerSize string
param workerSizeId string
param numberOfWorkers string

resource bootcampsp 'Microsoft.Web/serverfarms@2018-11-01' = {
  name: 'bootcampsp'
  location: 'East US'
  kind: 'linux'
  tags: {
  }
  properties: {
    name: 'bootcampsp'
    workerSize: '0'
    workerSizeId: '0'
    numberOfWorkers: '1'
    reserved: true
    zoneRedundant: false
  }
  sku: {
    tier: 'Free'
    name: 'F1'
  }
}