//
//  CategoryList.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import Foundation

struct CategoryList: Decodable {
    
    let drinks: [Category]
      
      enum CodingKeys: String, CodingKey {
          case drinks
      }
      
      init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          drinks = try container.decode([Category].self, forKey: .drinks)
      }
}
