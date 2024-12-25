//
//  RoqaaLevel2.swift
//  game_level1
//
//  Created by Fai Alharthi on 24/06/1446 AH.
//

import GameplayKit
import SpriteKit
import UIKit

class RoqaaLevel2: SKScene {
    // تعريف المتغيرات
    var lives: Int = 3 // عدد القلوب
    var hearts: [SKSpriteNode] = [] // مصفوفة لعرض القلوب
    var timerRectangle: SKShapeNode! // المستطيل الذي يمثل التايمر
    var timer: Timer? // المؤقت
    var timeRemaining: Int = 20 // الوقت المتبقي للمؤقت
    var isTimerStarted = false // متغير لتحديد ما إذا كان التايمر قد بدأ

    override func didMove(to view: SKView) {
        // زر الهوم
        let button = SKSpriteNode(imageNamed: "homeBotton")
        button.name = "button" // اسم الزر لتحديد الأكشن
        button.size = CGSize(width: 100, height: 100) // الحجم النسبي
        button.position = CGPoint(x: -500,y:330)
        button.zPosition = 1
        addChild(button)
        
        // إنشاء القلوب في أعلى المنتصف
        let heartSpacing: CGFloat = 10.0 // المسافة بين القلوب
        let heartWidth: CGFloat = size.width * 0.05 // عرض القلب النسبي
        let totalHeartsWidth = CGFloat(lives) * heartWidth + CGFloat(lives - 1) * heartSpacing
        let startX = -totalHeartsWidth / 2 + heartWidth / 2

        for i in 0..<lives {
            let heart = SKSpriteNode(imageNamed: "heart")
            heart.size = CGSize(width: heartWidth * 1.2, height: heartWidth * 1.2) // جعل القلب الممتلئ أكبر بنسبة 20%
            heart.position = CGPoint(x: startX + CGFloat(i) * (heartWidth + heartSpacing),
                                     y: size.height / 2 - heart.size.height / 2 - 50) // 50px padding from top
            heart.zPosition = 2
            addChild(heart)
            hearts.append(heart)
        }
        
        // الشخصية مع خصائصها
        let character = SKSpriteNode(imageNamed: "star")
        character.name = "character"
        character.size = CGSize(width:150,height: 150) // حجم الشخصية النسبي
        character.position = CGPoint(x:0, y:60) // في المنتصف السفلي
        character.zPosition = 1
        character.alpha = 1.0
        addChild(character)
        
        // حركة الشخصية
        let move1 = SKAction.move(to: CGPoint(x: -480, y:  250), duration: 3)
        let move2 = SKAction.move(to: CGPoint(x: -480, y:  -220), duration: 3)
        let move3 = SKAction.move(to: CGPoint(x: -240, y:  250), duration: 3)
        let move4 = SKAction.move(to: CGPoint(x: -160, y:  -220), duration: 3)
        let move5 = SKAction.move(to: CGPoint(x: 0, y:  240), duration: 3)
        let move6 = SKAction.move(to: CGPoint(x: 0, y:  -130), duration: 3)
        let move7 = SKAction.move(to: CGPoint(x: 160, y:  240), duration: 3)
        let move8 = SKAction.move(to: CGPoint(x: 240, y:  -160), duration: 3)
        let move9 = SKAction.move(to: CGPoint(x: 400, y:  220), duration: 3)
        let move10 = SKAction.move(to: CGPoint(x: 400, y:  -80), duration: 3)
        let join = SKAction.sequence([move1, move2, move3, move4, move5, move6, move7,move8,move9,move10])
        character.run(join) { [weak self] in
            // بعد توقف النجمة، نبدأ التايمر
            self?.startTimer()
        }

        // إضافة الفريم في أقصى اليمين
        let frame = SKSpriteNode(imageNamed: "frame")
        frame.size = CGSize(width: size.width * 0.25, height: size.height * 0.1) // حجم الفريم
        frame.position = CGPoint(x: size.width / 2 - frame.size.width / 2 - 20, // أعلى اليمين مع padding
                                 y: size.height / 2 - frame.size.height / 2 - 50)
        frame.zPosition = 1
        addChild(frame)
        
        // إضافة المستطيل الذي يمثل التايمر
        // Adding the timer rectangle
        let rectPath = CGPath(roundedRect: CGRect(x: -195, y: -68, width: 205, height: 46), cornerWidth: 17, cornerHeight: 17, transform: nil)
        timerRectangle = SKShapeNode(path: rectPath)
        timerRectangle.fillColor = SKColor(hex: 0xAC5848) // Desired color
        timerRectangle.lineWidth = 0 // Set border width to zero to make it borderless
        timerRectangle.position = CGPoint(x: size.width / 2 - 100, y: size.height / 2 - 45) // Adjust position above the frame
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
        let back = homee(size: size)
        back.scaleMode = .resizeFill
        self.view?.presentScene(back, transition: SKTransition.fade(withDuration: 0.5))
    }

    func winpage() {
        let move = homee(size: size)
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
        let gameOverScene = homee(size: size)
        gameOverScene.scaleMode = .resizeFill
        self.view?.presentScene(gameOverScene, transition: SKTransition.fade(withDuration: 0.5))
    }
}

// إضافة خاصية اللون ل SKColor
extension SKColor {
    convenience init(hex: Int) {
        self.init(red: CGFloat((hex >> 16) & 0xFF) / 255.0,
                  green: CGFloat((hex >> 8) & 0xFF) / 255.0,
                  blue: CGFloat(hex & 0xFF) / 255.0,
                  alpha: 1.0)
    }
}
