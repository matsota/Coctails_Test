//
//  NavigationCases.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import Foundation

class NavigationCases{
    
    enum Transition: String, CaseIterable {
        
        /// IDs of View Controllers
        case DrinkListVC
        case FilterListVC
        
        /// Identifier of Cells
        case DrinkTVCell
        case DrinksCVCell
        
        case CategoryTVCell
        
        /// Names of storyboards
        case DrinkList
        case FilterList
        
        /// Entity names
        case CategoryEntity
        
    }
    
}
