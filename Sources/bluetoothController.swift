import Bluetooth
import BluetoothLinux

class STBluetoothController {
    init(){
        guard let hostController = HostController.default else {
            print("No bluetooth adapter found.")
            return;
        }
        do{
            let parameters = HCILESetAdvertisingParameters.init(interval: (min: AdvertisingInterval.init(rawValue: 100)!, max: AdvertisingInterval.init(rawValue: 5000)!), 
                                advertisingType: .directed, 
                                ownAddressType: .public, 
                                directAddresssType: .public, 
                                directAddress: .zero,
                                channelMap: .all,
                                filterPolicy: .any)             

            try hostController.setLowEnergyAdvertisingParameters(parameters,
                                       timeout: .default)
            try hostController.enableLowEnergyAdvertising(true, timeout: .default)

            //hostController.setPeriodicAdvertisingEnable(enable: HCILESetPeriodicAdvertisingEnable.Enable, advertisingHandle: UInt8, timeout: .default)
        }
        catch {
            print("Error enabling advertising.")
            print("Unexpected error: \(error).")            
        }
        
        print("Bluetooth ready")
    }
}