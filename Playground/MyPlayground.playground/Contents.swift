import UIKit

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee: Coffee {
    var cost: Int {
        return 10
    }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class Milk: CoffeeDecorator {
    let base: Coffee
    var cost: Int {
        return base.cost + 5
    }
    required init(base: Coffee) {
        self.base = base
    }
}

class Whip: CoffeeDecorator {
    let base: Coffee
    var cost: Int {
        return base.cost + 7
    }
    required init(base: Coffee) {
        self.base = base
    }
}

class Sugar: CoffeeDecorator {
    let base: Coffee
    var cost: Int {
        return base.cost + 2
    }
    required init(base: Coffee) {
        self.base = base
    }
}

class Rum: CoffeeDecorator {
    let base: Coffee
    var cost: Int {
        return base.cost + 100
    }
    required init(base: Coffee) {
        self.base = base
    }
}

let coffee = SimpleCoffee()
let americano = Sugar(base: coffee)
let latte = Milk(base: Sugar(base: americano))
let adultCoffee = Rum(base: Rum(base: SimpleCoffee()))
let slop = Whip(base: Rum(base: americano))

print (coffee.cost)
print (americano.cost)
print (latte.cost)
print (adultCoffee.cost)
print (slop.cost)


