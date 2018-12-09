import Glibc
import Foundation
import SwiftyGPIO


func setGPIO(){
	let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPiPlusZero)
	guard let ledGPIO = gpios[.P7] else {
        	fatalError("It has not been possible to initialised the LED GPIO pin")
	}
}

setGPIO()
