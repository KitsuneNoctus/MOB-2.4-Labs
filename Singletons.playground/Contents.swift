import UIKit

class DataSource{
    static let sharedInstance = DataSource()
    
    var creationalPatternsArray = ["Abstract Factory", "Factory Method",
                                   "Builder", "Dependency Injection", "Lazy Initialization",
                                   "Object Pool", "Prototype", "Singleton"]
    
    private init() {
        print("self is:", self)
        print("creationalPatternsArray is", creationalPatternsArray)
    }
}

let data = DataSource.sharedInstance
print(data)

func looper(){
    
    for pattern in data.creationalPatternsArray{
        print(pattern)
    }

//  for num in 1...5 {
//          _ = DataSource.sharedInstance
//          print("num is:", num)
//    }
}
looper()
