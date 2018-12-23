import Bluetooth
import BluetoothLinux

class STBluetoothController {
    init(){
        guard let hostController = HostController.default else {
            print("No bluetooth adapter found.")
            return;
        }
        do{
            let socket =  try L2CAPSocket.init(controllerAddress: hostController.address, protocolServiceMultiplexer: 0, channelIdentifier: ATT.CID, addressType: .lowEnergyPublic, securityLevel: .low)
        }
        catch {
            print("Error creating socket.")
        }
        
        print("Bluetooth ready")
    }
}