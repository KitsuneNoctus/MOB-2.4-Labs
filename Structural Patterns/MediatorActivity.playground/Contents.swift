import UIKit

enum Concentration{
    case MOB
    case FEW
    case BEW
    case DS
}

class Student{
    var name: String
    var concentration: Concentration!
    var mediator: Mediator
    
    init(name: String, concentration: Concentration, mediator: Mediator) {
        self.name = name
        self.concentration = concentration
        self.mediator = mediator
    }
    
    func send(request: Request){
        print("\(name) sent request: \(request.message)")
        mediator.send(request: request)
    }
}

class TA{
    var name: String
    var concentration: Concentration!
    var mediator: Mediator
    
    init(name: String, concentration: Concentration, mediator: Mediator) {
        self.name = name
        self.concentration = concentration
        self.mediator = mediator
    }
    
    func recieve(request: Request){
        print("\(name) recieved request from \(request.student.name): \(request.message)")
    }
}

class Request{
    var message: String
    var student: Student
    
    init(message: String, student: Student){
        self.message = message
        self.student = student
    }
}

protocol Mediator{
    func send(request: Request)
}


class CoWorkHost: Mediator{
    var students: [Student] = []
    var tas: [TA] = []
    
    func addStudent(student: Student){
        students.append(student)
    }
    
    func addTA(ta: TA){
        tas.append(ta)
    }
    
    func send(request: Request) {
        for ta in tas{
            if ta.concentration == request.student.concentration{
                ta.recieve(request: request)
            }
        }
    }
}


var requestManager = CoWorkHost()

var marie = Student(name: "Marie", concentration: .MOB, mediator: requestManager)

var bob = Student(name: "Bob", concentration: .DS, mediator: requestManager)

var claudia = Student(name: "claudia", concentration: .BEW, mediator: requestManager)

var jess = TA(name: "Jess", concentration: .MOB, mediator: requestManager)
var samir = TA(name: "Samir", concentration: .DS, mediator: requestManager)
var rediet = TA(name: "Rediet", concentration: .BEW, mediator: requestManager)

requestManager.addStudent(student: marie)
requestManager.addStudent(student: bob)
requestManager.addStudent(student: claudia)

requestManager.addTA(ta: jess)
requestManager.addTA(ta: samir)
requestManager.addTA(ta: rediet)

marie.send(request: Request(message: "I want to review constraints", student: marie))
bob.send(request: Request(message: "I need help with Titanic Assignment", student: bob))
claudia.send(request: Request(message: "I forgot", student: claudia))
