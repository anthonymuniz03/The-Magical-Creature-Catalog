struct Creature {
    var name: String
    var description: String
    var isGood: Bool
    var magicPower: Int
    
    var ability: String {
        var abilityDescription = ""
        
        if fibonacciAbility(at: magicPower) > 500 {
            abilityDescription = "Their proficiency with magic is very high, grants large area attacks with fire"
        } else if fibonacciAbility(at: magicPower) > 50 && fibonacciAbility(at: magicPower) < 100 {
            abilityDescription = "They are better than average with magic, grants the ability to travel with portals"
        } else {
            abilityDescription = "Their magic ability is low, they can cast small fireballs"
        }
        return abilityDescription
    }
    
    func interactWith(_ secondCreature: Creature) -> String {
        switch (self.isGood, secondCreature.isGood) {
        case (true, true):
            return "Both the \(self.name) and \(secondCreature.name) are acting peacefully"
        case (true, false):
            return "\(secondCreature.name) started a fight with \(self.name)"
        case (false, true):
            return "\(self.name) started a fight with \(secondCreature.name)"
        case (false, false):
            return "Both the \(self.name) and \(secondCreature.name) are acting aggressively"
        }
        
    }
    
}

    let unicorn = Creature.init(name: "Unicorn",
                                description: "A magical horse with a horn, not be confused with a pegasus",
                                isGood: true,
                                magicPower: 10)

    let dragon = Creature.init(name: "Dragon",
                                description: "A fierce flying lizard that is often depicted within a medieval setting",
                                isGood: false,
                                magicPower: 6)

    let phoenix = Creature.init(name: "Phoenix",
                                description: "A legendary bird that is said to rise from the dead...like a phoenix",
                                isGood: true,
                                magicPower: 15)


func fibonacciAbility(at inputPower: Int) -> Int {
    var fibonacciSeries: [Int] = []
    
    for index in 0...inputPower {
        if index == 0 {
            fibonacciSeries.append(0)
        } else if index == 1 {
            fibonacciSeries.append(1)
        } else {
            let element1 = fibonacciSeries[fibonacciSeries.count - 1]
            let element2 = fibonacciSeries[fibonacciSeries.count - 2]
            fibonacciSeries.append(element1 + element2)
        }
    }
    return fibonacciSeries[inputPower]
}

var creatureCatalog = [unicorn, dragon, phoenix]

func describeCreature() {
    print("The creatures and their abilities based on their magic power!")
    print(" ") //Wanted some space in the output!
    
    print("\(creatureCatalog[0].name): \(creatureCatalog[0].description) - \(unicorn.ability)")
    print("\(creatureCatalog[1].name): \(creatureCatalog[1].description) - \(dragon.ability)")
    print("\(creatureCatalog[2].name): \(creatureCatalog[2].description) - \(phoenix.ability)")
    print(" ") //Wanted some space in the output!

    print("Interactions between the creatures based on being good or not!")
    print(" ") //Wanted some space in the output!

    for (index, creature) in creatureCatalog.enumerated() {
        
        for secondIndex in 0..<creatureCatalog.count {
            if index != secondIndex {
                let otherCreature = creatureCatalog[secondIndex]
                print(creature.interactWith(otherCreature))
            }
        }
    }


}

describeCreature()
