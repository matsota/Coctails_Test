//
//  Category.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import Foundation

struct Category: Decodable {
    
    var strCategory: String
    
    enum CodingKeys: String, CodingKey {
        case strCategory
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        
    }
    
}
