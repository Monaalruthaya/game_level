//
//  GameScene.swift
//  game
//
//  Created by Bshayr369 on 24/06/1446 AH.
//

import SpriteKit
import GameplayKit

class page1: SKScene {
    
//    
//    let homeButton = SKSpriteNode(imageNamed: "home")
//    let nextButton = SKSpriteNode(imageNamed: "arrow")
//    let foxNode = SKSpriteNode(imageNamed: "fox cele") // صورة الثعلب
//    let successLabel = SKLabelNode(fontNamed: "AvenirNext-Bold") // النص
//    
//    // MARK: - إعداد المشهد
//    override func didMove(to view: SKView) {
//        // زر الهوم 🏠
//        homeButton.name = "homeButton"
//        homeButton.position = CGPoint(x: -500, y: 330) // بالقرب من الزاوية العلوية اليسرى
//        homeButton.size = CGSize(width: 100, height: 100)
//        homeButton.zPosition = 1
//        addChild(homeButton)
//        
//        // البوب-أب 📦
//        let popup = SKSpriteNode(imageNamed: "sq")
//        popup.size = CGSize(width: 700, height: 400)
//        popup.position = CGPoint(x: 0, y:  0)
//        
//        popup.zPosition = 2
//        addChild(popup)
//        // الثعلب 🦊
//        foxNode.name = "foxNode"
//        foxNode.position = CGPoint(x:-160 ,y:0) // فوق منتصف الشاشة بقليل
//        foxNode.zPosition = 3
//        addChild(foxNode)
//        // زر التالي ⏩
//        nextButton.name = "nextButton"
//        nextButton.position = CGPoint(x: 260, y: -140) // في الأسفل
//        nextButton.zPosition = 4
//        addChild(nextButton)
//        
//        // النص 📜
//        successLabel.text = "أحسنت، يلا ننتقل للمستوى الثاني"
//        successLabel.fontSize = 25
//        successLabel.fontColor = .black // or any other built-in color
//        successLabel.position = CGPoint(x: 500 , y: 400) // أسفل الثعلب بقليل
//        successLabel.zPosition = 5
//       
//        addChild(successLabel)
//        
//    }
//    
//    
//    // تحديد مكان اللمس
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let location = touch.location(in: self)
//            let touchedNode = atPoint(location)
//            
//
//            if touchedNode.name == "homeButton" {
//                buttonAction()
//            } else if touchedNode.name == "nextButton" {
//                winpage()
//               
//            }
//            
//        }
//    }
//
//    func buttonAction() {
//        let back = homee(size: size)
//        back.scaleMode = .resizeFill
//        self.view?.presentScene(back, transition: SKTransition.fade(withDuration: 0.5))
//    }
//
//    func winpage() {
//        let move = homee(size: size)
//        move.scaleMode = .resizeFill
//        self.view?.presentScene(move, transition: SKTransition.fade(withDuration: 0.5))
//    }
//
//    
//}




    let homeButton = SKSpriteNode(imageNamed: "home")
    let nextButton = SKSpriteNode(imageNamed: "arrow")
    let foxNode = SKSpriteNode(imageNamed: "fox cele")
    let successLabel = SKLabelNode(fontNamed: "AvenirNext-Bold") // النص
    
    // MARK: - إعداد المشهد
   
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = CGSize(width: size.width, height: size.height)
        background.zPosition = -1
        addChild(background)
        
        
        
        
        
        // زر الهوم
        let button = SKSpriteNode(imageNamed: "homeBotton")
        button.name = "button" // اسم الزر لتحديد الأكشن
        button.size = CGSize(width: 100, height: 100) // الحجم النسبي
        button.position = CGPoint(x: 70,y:720)
        button.zPosition = 1
        addChild(button)

        
        // البوب-أب 📦
        let popup = SKSpriteNode(imageNamed: "sq")
        popup.size = CGSize(width: 700, height: 400)
        popup.position = CGPoint(x: 600, y: 400)
        popup.zPosition = 2
        addChild(popup)
        
        // الثعلب 🦊
        foxNode.name = "surprise"
        foxNode.position = CGPoint(x: 400, y: 400)
        foxNode.zPosition = 3
        addChild(foxNode)
        
        // زر التالي ⏩
        nextButton.name = "nextButton"
        nextButton.position = CGPoint(x: 850, y: 250)
        nextButton.zPosition = 6
        addChild(nextButton)
        
        // النص 📜
        successLabel.text = "أحسنت، يلا ننتقل للمستوى الثاني"
        successLabel.fontSize = 25
        successLabel.fontColor = .font // or any other built-in color
        successLabel.position = CGPoint(x: 700, y: 390)
        successLabel.zPosition = 5
        addChild(successLabel)
    }
    
    // تحديد مكان اللمس
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "button" {
                buttonAction()
            } else if touchedNode.name == "nextButton" {
                game_level_1()
            }
        }
    }

    func buttonAction() {
        let back = HomeScene(size: size)
        back.scaleMode = .resizeFill
        self.view?.presentScene(back, transition: SKTransition.fade(withDuration: 0.5))
    }

    func game_level_1() {
        let move = RoqaaLevel2(size: size)
        move.scaleMode = .resizeFill
        self.view?.presentScene(move, transition: SKTransition.fade(withDuration: 0.5))
    }
}
