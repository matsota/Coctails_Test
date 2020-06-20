//
//  Coctail.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import Foundation


struct Drink: Decodable {
    
    var strDrink: String
    var strDrinkThumb: String
    var idDrink: String
    
    enum CodingKeys: String, CodingKey {
        case strDrink
        case strDrinkThumb
        case idDrink
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        strDrink = try container.decode(String.self, forKey: .strDrink)
        strDrinkThumb = try container.decode(String.self, forKey: .strDrinkThumb)
        idDrink = try container.decode(String.self, forKey: .idDrink)
    }
    
}
