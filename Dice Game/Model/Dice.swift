//
//  Dice.swift
//  Dice Game
//
//  Created by Oleksandr Smakhtin on 27.12.2022.
//

import Foundation
import UIKit

struct Dices {
    
    static let dices = [
        Dice(dice: UIImage(named: "dice1")!, number: 1),
        Dice(dice: UIImage(named: "dice2")!, number: 2),
        Dice(dice: UIImage(named: "dice3")!, number: 3),
        Dice(dice: UIImage(named: "dice4")!, number: 4),
        Dice(dice: UIImage(named: "dice5")!, number: 5),
        Dice(dice: UIImage(named: "dice6")!, number: 6)
    ]
    
    
}


struct Dice {
    let dice: UIImage
    let number: Int
}
