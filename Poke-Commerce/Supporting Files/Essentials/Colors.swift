//
//  Colors.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 21/06/21.
//

import UIKit

enum Colors {
    case navigation
    case section
    case tabbar(type: TabBarState)
    case profile(type: ProfileState)
    
    enum TabBarState {
        case selected
        case unselected
        case background
    }
    
    enum ProfileState {
        case emptyProfile
        case commomProfile
    }
    
    var color: UIColor {
        switch self {
        case .navigation: return #colorLiteral(red: 0.9490196078, green: 0.2235294118, blue: 0.2156862745, alpha: 1)
        case .section: return #colorLiteral(red: 0.7843137255, green: 0.08235294118, blue: 0.06274509804, alpha: 1)
        case .tabbar(let type):
            switch type {
            case .selected: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            case .unselected: return #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            case .background: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        case .profile(let type):
            switch type {
            case .emptyProfile: return #colorLiteral(red: 0.4077839851, green: 0.6293930411, blue: 0.3699025512, alpha: 1)
            case .commomProfile: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
}
