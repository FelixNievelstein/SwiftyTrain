import Bluetooth
import BluetoothLinux

class STBluetoothController {
    init(){
        guard let hostController = HostController.default else {
            print("No bluetooth adapter found.")
            return;
        }
        do{                       
            // stop advertising
            print("stop advertising")
            do { try hostController.enableLowEnergyAdvertising(false, timeout: .default) }
            catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
            
            print("set parameters")
            // set advertising parameters                                
            let parameters = HCILESetAdvertisingParameters.init(interval: (min: AdvertisingInterval.init(rawValue: 100)!, max: AdvertisingInterval.init(rawValue: 5000)!), 
                                advertisingType: .directed, 
                                ownAddressType: .public, 
                                directAddresssType: .public, 
                                directAddress: .zero,
                                channelMap: .all,
                                filterPolicy: .any)  
            try hostController.deviceRequest(parameters, timeout: .default)
            
            print("start advertising")
            // start advertising
            do { try hostController.enableLowEnergyAdvertising(timeout: .default) }
            catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
            //hostController.setPeriodicAdvertisingEnable(enable: HCILESetPeriodicAdvertisingEnable.Enable, advertisingHandle: UInt8, timeout: .default)
        }
        catch {
            print("Error enabling advertising.")
            print("Unexpected error: \(error).")            
        }
        
        print("Bluetooth ready")
    }
}