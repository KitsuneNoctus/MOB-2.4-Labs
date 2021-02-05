import UIKit

enum ComponentType {
    case button
    case label
    case image
}

//over simplified subclasses as examples
//when instantiated, these will be concrete products from the factory
class SettingsButton: UIButton{}
class SettingsLabel: UILabel{}
class SettingsImage: UIImageView{}

class MenuButton: UIButton{}
class MenuLabel: UILabel{}
class MenuImage: UIImageView{}

protocol ComponentFactory {
    //this is the factory method
    func createView(component: ComponentType) -> UIView
}

//this class will be the creator
//it will apply logic and  decide what needs to be instantiated based on given arguments

class MenuComponentFactory: ComponentFactory {
    func createView(component: ComponentType) -> UIView {
        switch component {
        case .button:
            return MenuButton()
        case .label:
            return MenuLabel()
        case .image:
            return MenuImage()
        }
    }
}

class SettingsComponentFactory: ComponentFactory {
    func createView(component: ComponentType) -> UIView {
        switch component {
        case .button:
            return SettingsButton()
        case .label:
            return SettingsLabel()
        case .image:
            return SettingsImage()
        }
    }
}

//asks for a menu label
let settingsFactory = SettingsComponentFactory()
settingsFactory.createView(component: .button)

let menuFactory = MenuComponentFactory()
menuFactory.createView(component: .label)

/// A cool component
//https://www.swiftbysundell.com/tips/creating-extensions-with-static-factory-methods/
//extension MenuButton{
//    static func makeForUse() -> UIButton{
//        let button = UIButton()
//        return button
//    }
//}
