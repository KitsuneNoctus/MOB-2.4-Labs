import UIKit

struct Message {
    let from: String
    let to: String
    let subject: String
}

class Transmitter {
    var nextLink: Transmitter?
    required init() {}
    func sendMessage(message:Message) {
        if (nextLink != nil) {
            nextLink!.sendMessage(message: message)
        } else {
            print("End of chain reached. Message not sent")
        }
    }

    class func matchEmailSuffix(message:Message) -> Bool {
        // TODO: Refactor time. Put your logic used before in this new method
        let msgFrom = message.from.split(separator: "@").dropFirst()
        let msgTo = message.to.split(separator: "@").dropFirst()
        
        if msgFrom == msgTo{
            return true
        }
        return false
    }

    class func createChain() -> Transmitter? {
        let transmitterClasses:[Transmitter.Type] = [ PriorityTransmitter.self, LocalTransmitter.self, RemoteTransmitter.self
        ]
        var link:Transmitter?
        for tClass in transmitterClasses.reversed() {
            let existingLink = link
            link = tClass.init()
            link?.nextLink = existingLink
        }
        return link
    }
}

//class LocalTransmitter  {
//    func sendMessage(message: Message) {
//        print("Message to \(message.to) sent locally")
//    }
//}
//
//class RemoteTransmitter  {
//    func sendMessage(message: Message) {
//        print("Message to \(message.to) sent remotely")
//    }
//}
//
//class PriorityTransmitter  {
//    func sendMessage(message: Message) {
//        print("Message to \(message.to) sent as priority")
//    }
//}

class LocalTransmitter: Transmitter  {
    override func sendMessage(message: Message) {
        if (Transmitter.matchEmailSuffix(message: message)) {
            print("Message to \(message.to) sent locally")
        } else {
            super.sendMessage(message: message);
        }
    }
}

class RemoteTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if (!Transmitter.matchEmailSuffix(message: message)) {
            print("Message to \(message.to) sent remotely")
        } else {
            super.sendMessage(message: message)
        }
    }
}


class PriorityTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if (message.subject.hasPrefix("Priority")) {
            print("Message to \(message.to) sent as priority")
        } else {
            super.sendMessage(message: message)
        }
    }
}

let messages = [
    Message(from: "adriana@ms.com", to: "mitchell@ms.com", subject: "MOB Courses"),
    Message(from: "adriana@ms.com", to: "jess@students.com", subject: "TA Updates"),
    Message(from: "ashu@ms.com", to: "all@ms.com", subject: "Priority: All-Hands Meeting")
]

// Creating the transmitter
let localT = LocalTransmitter()
let remoteT = RemoteTransmitter()
let priorityT = PriorityTransmitter()

// Processing each message
//for msg in messages {
//    // TODO: Use the business rules to code this logic
//    let msgFrom = msg.from.split(separator: "@").dropFirst()
//    let msgTo = msg.to.split(separator: "@").dropFirst()
//
//    if msg.subject.hasPrefix("Priority"){
//        priorityT.sendMessage(message: msg)
//    }else{
//        if msgFrom == msgTo{
//            localT.sendMessage(message: msg)
//        }else{
//            remoteT.sendMessage(message: msg)
//        }
//    }
//}

if let chain = Transmitter.createChain() {
    for msg in messages {
        chain.sendMessage(message: msg)
    }
}
