@description('Name of the Network Security Group')
param nsgName string = 'app-segmentation-nsg'

@description('Location')
param location string = resourceGroup().location

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowAppToDb'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '1433'
          sourceAddressPrefix: '10.10.10.0/24'
          destinationAddressPrefix: '10.10.20.0/24'
        }
      }
      {
        name: 'DenyInternetToDb'
        properties: {
          priority: 200
          direction: 'Inbound'
          access: 'Deny'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'Internet'
          destinationAddressPrefix: '10.10.20.0/24'
        }
      }
    ]
  }
}
