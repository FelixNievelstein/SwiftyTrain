import Bluetooth
import BluetoothLinux

class STBluetoothController {
    init(){
        guard let hostController = HostController.default else {
            print("No bluetooth adapter found.")
            return;
        }
        do{
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