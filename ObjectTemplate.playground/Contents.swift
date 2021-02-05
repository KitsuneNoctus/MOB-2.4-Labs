import UIKit


//MARK: Currently incorrect

var products = [ ("Kayak", 275.0, 10), ("Lifejacket", 48.95, 14), ("Soccer Ball", 19.5, 32)]

class calculate{
    var name: String?
    var price: Double?
    var stock: Int?
    var products: [(String, Double, Int)]
    
    init(products: [(String, Double, Int)]) {
        self.products = products
    }
    
    func calculateTax(itemNumber: Int) -> Double {
        return self.products[itemNumber].1 * 0.2;
    }

    func calculateStockValue() -> Double {
        return self.products.reduce(0, {
            (total, product) -> Double in
            return total + (product.1 * Double(product.2))
        });
    }

}

//print("Sales tax for Kayak: $\(calculate.calculateTax(calculate(itemNumber: 0)))")
//print("Total value of stock: $\(calculate.calculateStockValue(self))")
