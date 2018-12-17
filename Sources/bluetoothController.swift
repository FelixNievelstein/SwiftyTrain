import Bluetooth
import BluetoothLinux

class STBluetoothController {
    init(){
        guard let hostController = HostController.default else {
            print("No bluetooth adapter found.")
            return;
        }
        print("Bluetooth ready")
    }
}