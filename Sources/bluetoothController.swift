import Bluetooth
import BluetoothLinux

class STBluetoothController {
    init(){
        guard let hostController = HostController.default else {
            print("No bluetooth adapter found.")
            return;
        }
        do{
            hostController.enableLowEnergyAdvertising(_ isEnabled: true, timeout: HCICommandTimeout = .default)
            //hostController.setPeriodicAdvertisingEnable(enable: HCILESetPeriodicAdvertisingEnable.Enable, advertisingHandle: UInt8, timeout: .default)
        }
        catch {
            print("Error creating socket.")
        }
        
        print("Bluetooth ready")
    }
}