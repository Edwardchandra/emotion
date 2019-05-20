//
//  ViewController.swift
//  Sadness
//
//  Created by Edward Chandra on 20/05/19.
//  Copyright © 2019 Edward Chandra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //variables
    var gradient: CAGradientLayer!
    var audioPlayer: AVAudioPlayer!
    var rainEmitter: CAEmitterLayer!
    
    
    //outlets
    @IBOutlet weak var candleLight: UIView!
    @IBOutlet weak var btnFlame: UIButton!
    
    @IBOutlet weak var viewBackground: UIImageView!
    @IBOutlet weak var viewBackground2: UIImageView!
    
    @IBOutlet weak var starsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientBackground()
        rainAnimation()
        rainAudioPlayer()
        candleLightAnimation()
        candleLight.alpha = 0
     
        swipeRightToLeft()
    }
    
    func swipeRightToLeft(){
        
        let swipeRightToLeftGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector(("showParentViewController")))
        swipeRightToLeftGesture.direction = UISwipeGestureRecognizer.Direction.up
    
        self.view.addGestureRecognizer(swipeRightToLeftGesture)
        
    }
    
    func showParentViewController() {
        self.performSegue(withIdentifier: "rightToLeftSegue", sender: self)
    }
    
    @IBAction func btnFlameAction(_ sender: UIButton) {
        //trigger flame from candle
        
        UIButton.animate(withDuration: 2, animations: {
            self.viewBackground.alpha = 0
            self.viewBackground2.alpha = 1.0
            self.candleLight.alpha = 1.0
            self.starsView.alpha = 1.0
            self.audioPlayer.stop()
        })
        
        Emitter.endParticles(emitter: rainEmitter)
        animateGradientBackground()
        
    }
    
    func candleLightAnimation(){
        //create candle light animation
        
        let emitter = LightEmitter.get(with: UIImage.init(named: "candleLight")!)
        emitter.emitterPosition = CGPoint(x: self.candleLight.frame.width/2, y: self.candleLight.frame.height)
        emitter.emitterSize = CGSize(width: 1, height: 1)
        self.candleLight.layer.addSublayer(emitter)
    }

    func rainAudioPlayer(){
        //create rain sound
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "rainSound", ofType: "wav")!))
            audioPlayer.prepareToPlay()
        }catch{
            print("Audio Error")
        }
        audioPlayer.play()
        audioPlayer.numberOfLoops = -1
    }
    
    func rainAnimation(){
        //create rain animation
        
        rainEmitter = Emitter.get(with: UIImage.init(named: "rainImage4")!)
        rainEmitter.emitterPosition = CGPoint(x: self.view.frame.width/2, y: 0)
        rainEmitter.emitterSize = CGSize(width: self.view.frame.width, height: 3)
        self.view.layer.insertSublayer(rainEmitter, at: 1)
    }
    
    func gradientBackground(){
        //create gradient background
        
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.black.cgColor,UIColor.init(displayP3Red: 7/255, green: 13/255, blue: 89/255, alpha: 1).cgColor]
        
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func animateGradientBackground(){
        //animate gradient background
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 6.0
        gradientAnimation.toValue = [UIColor.black.cgColor, UIColor.init(displayP3Red: 31/255, green: 60/255, blue: 136/255, alpha: 1).cgColor, UIColor.orange.cgColor]
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientAnimation.isRemovedOnCompletion = false
        gradient.add(gradientAnimation, forKey: "colorChange")
    }
    
    //Audio Used from http://soundbible.com/1999-Rain.html
    //Animating Gradient from http://prabhu.xyz/2017/04/26/working-with-gradient-layers-in-swift.html
    //Rain Animation by Mark Moeykens from https://www.youtube.com/watch?v=Cg5GzKsMF7M

}

