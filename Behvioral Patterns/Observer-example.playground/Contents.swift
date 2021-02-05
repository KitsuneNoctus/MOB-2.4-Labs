import UIKit

// The Observable protocol that will be used by subjects.
protocol Observable {
    func addObserver(_ observer:Observer)
    func removeObserver(_ observer:Observer)
    var observers : [Observer] {get set}
}

// The Observer protocol declares the update method.
protocol Observer: class  {
    func update(subject: Subject)
}

//Subject implementation
class Subject: Observable {

    // Keeping a state in the subject, that observers can access
    var state: Int = { return Int.random(in: 0...10) }()

    // Subject maintains a list of its observers
    var observers = [Observer]()

    //Adding an observer
    func addObserver(_ observer: Observer) {
        print("Subject: Attached an observer.\n")
        observers.append(observer)
    }

    //Removing an observer
    func removeObserver(_ observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
            print("Subject: Removed an observer.\n")
        }
    }

    // Trigger an update in each observer.
    func notifyObservers() {
        print("Subject: Notifying observers...\n")
        observers.forEach({ $0.update(subject: self)})
    }

    // The Subject would do some business logic that would trigger the notifications
    func someBusinessLogic() {
        print("\nSubject: I'm doing something important.\n")
        state = Int.random(in: 0...10)
        print("Subject: My state has just changed to: \(state)\n")
        notifyObservers()
    }
}


// Observers react to the updates issued by the Subject they had been subscribed to.
class ObserverA: Observer {
    func update(subject: Subject) {
        if subject.state < 3 {
            print("ObserverA: Reacted to the event.\n")
        }
    }
}

class ObserverB: Observer {
    func update(subject: Subject) {
        if subject.state >= 3 {
            print("ObserverB: Reacted to the event.\n")
        }
    }
}

let subject = Subject()
let observerA = ObserverA()
let observerB = ObserverB()
