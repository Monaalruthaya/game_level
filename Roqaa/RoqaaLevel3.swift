//
//  GameScene.swift
//  game_level1
//
//  Created by رشا القرني on 11/06/1446 AH.
//the edited one by fai

import GameplayKit
import SpriteKit
import UIKit
import SwiftUI

class RoqaaLevel3: SKScene {
    // تعريف المتغيرات
    var lives: Int = 3 // عدد القلوب
    var hearts: [SKSpriteNode] = [] // مصفوفة لعرض القلوب
    var timerRectangle: SKShapeNode! // المستطيل الذي يمثل التايمر
    var timer: Timer? // المؤقت
    var timeRemaining: Int = 20 // الوقت المتبقي للمؤقت
    var isTimerStarted = false // متغير لتحديد ما إذا كان التايمر قد بدأ

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
        
        // إنشاء القلوب في أعلى المنتصف
        let heartSpacing: CGFloat = 10.0 // المسافة بين القلوب
        let heartWidth: CGFloat = size.width * 0.05 // عرض القلب النسبي
        let totalHeartsWidth = CGFloat(lives) * heartWidth + CGFloat(lives - 1) * heartSpacing
        _ = -totalHeartsWidth / 2 + heartWidth / 2

        for i in 0..<lives {
            let heart = SKSpriteNode(imageNamed: "heart")
            heart.size = CGSize(width: heartWidth * 1.2, height: heartWidth * 1.2) // جعل القلب الممتلئ أكبر بنسبة 20%
            heart.position = CGPoint(x: CGFloat(600 + (i * 70)), y: 700) // 50px padding from top
            heart.zPosition = 2
            addChild(heart)
            hearts.append(heart)
        }
        
        // الشخصية مع خصائصها
        let character = SKSpriteNode(imageNamed: "star")
        character.name = "character"
        character.size = CGSize(width:100,height: 100) // حجم الشخصية النسبي
        character.position = CGPoint(x:600, y:400) // في المنتصف السفلي
        character.zPosition = 1
        character.alpha = 1.0
        addChild(character)
        
        // حركة الشخصية
        let move1 = SKAction.move(to: CGPoint(x: 100, y:  400), duration: 2)
       let move2 = SKAction.move(to: CGPoint(x: 1000, y:  500), duration: 2)
        let move3 = SKAction.move(to: CGPoint(x: 100, y:  600), duration: 2)
        let move4 = SKAction.move(to: CGPoint(x: 1000, y:  500), duration: 2)
       let move5 = SKAction.move(to: CGPoint(x: 800, y:  400), duration: 1)
       let move6 = SKAction.move(to: CGPoint(x: 700, y:  500), duration: 1)
       let move7 = SKAction.move(to: CGPoint(x: 400, y:  300), duration: 1)
        let move8 = SKAction.move(to: CGPoint(x: 200, y:  500), duration: 1)
       let move9 = SKAction.move(to: CGPoint(x: 800, y:  400), duration: 2)
        let move10 = SKAction.move(to: CGPoint(x: 300, y:  300), duration: 2)
        let move11 = SKAction.move(to: CGPoint(x: 800, y:  250), duration: 2)
        let move12 = SKAction.move(to: CGPoint(x: 400, y:  200), duration: 2)
       let move13 = SKAction.move(to: CGPoint(x: 1000, y:  100), duration: 2)
        let join = SKAction.sequence([move1, move2,move3,move4,move5,move6,move7,move8, move9,move10,move11,move12,move13])
        character.run(join)
        { [weak self] in
            // بعد توقف النجمة، نبدأ التايمر
            self?.startTimer()
        }

        // إضافة الفريم في أقصى اليمين
        let frame = SKSpriteNode(imageNamed: "frame")
        frame.size = CGSize(width: size.width * 0.25, height: size.height * 0.1) // حجم الفريم
        frame.position = CGPoint(x: 1000, y: 700)
        frame.zPosition = 1
        addChild(frame)
        
        // إضافة المستطيل الذي يمثل التايمر
        // Adding the timer rectangle
        let rectPath = CGPath(roundedRect: CGRect(x: -195, y: -68, width: 205, height: 46), cornerWidth: 17, cornerHeight: 17, transform: nil)
        timerRectangle = SKShapeNode(path: rectPath)
        timerRectangle.fillColor = SKColor(hex: 0xAC5848) // Desired color
        timerRectangle.lineWidth = 0 // Set border width to zero to make it borderless
        timerRectangle.position = CGPoint(x: 1068, y: 745) // Adjust position above the frame
        timerRectangle.zPosition = 2
        addChild(timerRectangle)

    }

    // بدء التايمر
    func startTimer() {
        timeRemaining = 20
        isTimerStarted = true // بدأ التايمر
        timerRectangle.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    // تحديث التايمر
    @objc func updateTimer() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            updateTimerRectangle()
        } else {
            timer?.invalidate() // إيقاف التايمر
            goToGameOverScene() // الانتقال مباشرة إلى مشهد النهاية
        }
    }

    // تحديث عرض المستطيل
    func updateTimerRectangle() {
        let filledWidth = 202 * CGFloat(timeRemaining) / 20.0 // حساب العرض بناءً على الوقت المتبقي
        let xPosition = -193 + (202 - filledWidth) // تعديل موقع x ليتناسب مع العرض المتناقص
        let fillPath = CGPath(roundedRect: CGRect(x: xPosition, y: -68, width: filledWidth, height: 46), cornerWidth: 17, cornerHeight: 17, transform: nil)
        timerRectangle.path = fillPath
    }



    // تحديد مكان اللمس
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            // إذا لم يكن التايمر قد بدأ، لا نفعل شيئًا
            if !isTimerStarted {
                return
            }

            if touchedNode.name == "button" {
                buttonAction()
            } else if touchedNode.name == "character" {
                winpage()
                timer?.invalidate() // إيقاف التايمر إذا تم لمس النجمة
            } else {
                loseLife()
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            }
        }
    }

    func buttonAction() {
        let back = HomeScene(size: size)
        back.scaleMode = .resizeFill
        self.view?.presentScene(back, transition: SKTransition.fade(withDuration: 0.5))
    }

    func winpage() {
        let move = winPage3(size: size)
        move.scaleMode = .resizeFill
        self.view?.presentScene(move, transition: SKTransition.fade(withDuration: 0.5))
    }

    func loseLife() {
        if lives > 0 {
            lives -= 1
            // Remove the current heart and replace it with an empty heart
            let heart = hearts[lives]
            heart.removeFromParent()

            // Create and add the empty heart in the same position
            let emptyHeart = SKSpriteNode(imageNamed: "emptyheart")
            emptyHeart.size = CGSize(width: heart.size.width * 0.8, height: heart.size.height * 0.8) // جعل القلب الفارغ أصغر بنسبة 20%
            emptyHeart.position = heart.position
            emptyHeart.zPosition = 2
            addChild(emptyHeart)

            // Replace the heart in the array with the empty heart
            hearts[lives] = emptyHeart
        }
        if lives == 0 {
            goToGameOverScene()
        }
    }

    func goToGameOverScene() {
        let gameOverScene = lossPage3(size: size)
        gameOverScene.scaleMode = .resizeFill
        self.view?.presentScene(gameOverScene, transition: SKTransition.fade(withDuration: 0.5))
    }

}
struct RoqaaLevel3View: View {
    var body: some View {
        SpriteView(scene: {
            let scene = RoqaaLevel3(size: CGSize(width: 300, height: 400))
            scene.size = UIScreen.main.bounds.size
            scene.scaleMode = .resizeFill
            return scene
        }())
        .ignoresSafeArea()
    }
}

#Preview {
    RoqaaLevel3View()
}
