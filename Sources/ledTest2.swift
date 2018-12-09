import Glibc
import Foundation
import SwiftyGPIO


func setGPIO(){
	let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPiPlusZero)
	guard let ledGPIO = gpios[.P7] else {
        	fatalError("It has not been possible to initialised the LED GPIO pin")
	}
	switchLED(ledGPIO: ledGPIO)
}


func switchLED(ledGPIO: GPIO){
	ledGPIO.direction = .OUT
	while (true) {
		sleep(1)
		ledGPIO.value = 1
		sleep(0)
		ledGPIO.value = 0
	}
}

setGPIO()
