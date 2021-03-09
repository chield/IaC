targetScope = 'subscription'

param rg1Name string
param rg1Location string = 'westeurope'
param vnet1Name string

resource rg1 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: '${rg1Name}'
  location: '${rg1Location}'
} 

module vnet1 '../network/virtualnetwork.bicep' = {
  name: 'vnet1'
  scope: resourceGroup(rg1.name)
  params:{
    vnetName: vnet1Name
    addressPrefixes:[
    '10.0.0.0/8'
    ]
    subnet1Name:'sn-01-${vnet1Name}'
    subnet2Name:'sn-02-${vnet1Name}'
    subnet1AddressPrefix: '10.1.1.0/24'
    subnet2AddressPrefix: '10.1.2.0/24'
  }
}