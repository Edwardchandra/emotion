//
//  Emitter.swift
//  Sadness
//
//  Created by Edward Chandra on 20/05/19.
//  Copyright © 2019 Edward Chandra. All rights reserved.
//

import Foundation
import UIKit

class Emitter{
    
    init() {
        
    }
    
    static func get(with image: UIImage) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCell(with: image)
        
        return emitter
    }
    
    static func generateEmitterCell(with image: UIImage) -> [CAEmitterCell]{
        let cell = CAEmitterCell()
        var cells = [CAEmitterCell]()
        
        cell.contents = image.cgImage
        cell.birthRate = 150
        cell.lifetimeRange = 100
        cell.velocity = CGFloat(800)
        cell.emissionLongitude = (180 * (.pi/180))
        
        cells.append(cell)
        
        return cells
    }
    
    static func endParticles(emitter: CAEmitterLayer) {
        emitter.birthRate = 0.0
    }
    
}
