//
//  LightEmitter.swift
//  Sadness
//
//  Created by Edward Chandra on 20/05/19.
//  Copyright © 2019 Edward Chandra. All rights reserved.
//

import Foundation
import UIKit

class LightEmitter{
    
    init() {
        
    }
    
    static func get(with image: UIImage) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.renderMode = CAEmitterLayerRenderMode.additive
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCell(with: image)
        
        return emitter
    }
    
    static func generateEmitterCell(with image: UIImage) -> [CAEmitterCell]{
        let cell = CAEmitterCell()
        var cells = [CAEmitterCell]()
        
        cell.contents = image.cgImage
        cell.birthRate = 120
        cell.alphaSpeed = -0.3
        cell.lifetime = 5
        cell.lifetimeRange = 0.5
        cell.color = UIColor.init(displayP3Red: 0.8, green: 0.6, blue: 0.4, alpha: 0.6).cgColor
        cell.velocity = 5
        cell.velocityRange = 1
        cell.emissionLongitude = CGFloat(Double.pi)
        cell.emissionRange = 0.5
        cell.yAcceleration = -12
        cell.scaleSpeed = 0.3
        
        cells.append(cell)
        
        return cells
    }
    
}
