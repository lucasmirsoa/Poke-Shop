//
//  TabbarView.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 21/06/21.
//

import UIKit

class TabbarView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabbarAttributes()
    }
}


// MARK: - Private Methods

extension TabbarView {
    
    private func setTabbarAttributes() {
    
        self.viewControllers?[0].tabBarItem = UITabBarItem(title: "Shop", image: #imageLiteral(resourceName: "shop-icon"), tag: 0)
        self.viewControllers?[1].tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile-icon"), tag: 0)
        
        self.tabBar.barTintColor = Colors.tabbar(type: .background).color
        self.tabBar.tintColor = Colors.tabbar(type: .selected).color
        self.tabBar.unselectedItemTintColor = Colors.tabbar(type: .unselected).color
    }
}


// MARK: - Public Methods

extension TabbarView {
    
    func setTabBarHidden(_ hidden: Bool, animated: Bool = true, duration: TimeInterval = 0.3) {
        if animated, let frame = self.tabBarController?.tabBar.frame  {
            let factor: CGFloat = hidden ? 1 : -1
            let y = frame.origin.y + (frame.size.height * factor)
            return UIView.animate(withDuration: duration, animations: {
                self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
            })
        }
        
        self.tabBar.isHidden = hidden
    }
}
