import Glibc
import Foundation
import SwiftyGPIO


func setGPIO(){
	let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPiPlusZero)
	guard let ledGPIO = gpios[.P4] else {
        	fatalError("It has not been possible to initialised the LED GPIO pin")
	}
	print("Setting GPIOs")
	switchLED(ledGPIO: ledGPIO)
}


func switchLED(ledGPIO: GPIO){

	ledGPIO.direction = .OUT
	while (true) {
		sleep(1)
		print("Switching signal ON")
		ledGPIO.value = 1
		sleep(1)
		print("Switching signal OFF")
		ledGPIO.value = 0
	}
}