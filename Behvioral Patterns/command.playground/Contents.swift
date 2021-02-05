import UIKit

// Receiver
class TelevisionControl {
   func turnOn() {
       print("Turning On TV")
   }
   func turnOff() {
     print("Turning Off TV")
   }
}

// Command
protocol TelevisionCommand {
   func execute()
}

class TurnOnTelevision: TelevisionCommand {
    // TODO: Complete implementation...
    public let televisionControl: TelevisionControl
    
    public init(_ televisionControl: TelevisionControl) {
        self.televisionControl = televisionControl
    }
    
    func execute() {
        self.televisionControl.turnOn()
    }

}

class TurnOffTelevision: TelevisionCommand {
   public let televisionControl: TelevisionControl

   public init(_ televisionControl: TelevisionControl) {
       self.televisionControl = televisionControl
   }
   public func execute() {
       self.televisionControl.turnOff()
   }
}

// Invoker
class RemoteControl {
    
    public let televisionControl: TelevisionControl
    
    // TODO: create Init()
    init(televisionControl: TelevisionControl) {
        self.televisionControl = televisionControl
    }
    
    func execute(_ command: TelevisionCommand) {
        
        // TODO: complete execute() function
        command.execute()
    }
    
}

let televisionControl = TelevisionControl()
let remoteControl = RemoteControl(televisionControl: televisionControl)
let turnOffTelevision = TurnOffTelevision(televisionControl)
//let turnOffTelevision = TurnOnTelevision(televisionControl)
remoteControl.execute(turnOffTelevision)
