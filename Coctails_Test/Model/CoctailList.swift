//
//  CoctailList.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import Foundation


struct DrinkList: Decodable {
    
    let drinks: [Drink]
    
    enum CodingKeys: String, CodingKey {
        case drinks
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        drinks = try container.decode([Drink].self, forKey: .drinks)
    }
}
