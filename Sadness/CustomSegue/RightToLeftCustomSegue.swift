//
//  RightToLeftCustomSegue.swift
//  Sadness
//
//  Created by Edward Chandra on 20/05/19.
//  Copyright © 2019 Edward Chandra. All rights reserved.
//

import UIKit

class RightToLeftCustomSegue: UIStoryboardSegue {

    override func perform() {
        
        let firstViewController = self.source.view
        let secondViewController = self.destination.view
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        secondViewController?.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondViewController!, aboveSubview: firstViewController!)
        
        UIView.animate(withDuration: 0.4, animations: {
            firstViewController?.frame = (firstViewController?.frame.offsetBy(dx: 0.0, dy: -screenWidth))!
            secondViewController?.frame = (secondViewController?.frame.offsetBy(dx: 0.0, dy: -screenWidth))!
        }) { _ in
            self.source.present(self.destination, animated: false, completion: nil)
        }
        
    }
    
}
