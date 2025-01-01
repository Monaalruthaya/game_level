import GameplayKit
import SpriteKit
import UIKit
import AVFoundation
import SwiftUI

class RoqaaLevel1: SKScene {
    // تعريف المتغيرات
    var lives: Int = 3 // عدد القلوب
    var hearts: [SKSpriteNode] = [] // مصفوفة لعرض القلوب
    var timerRectangle: SKShapeNode! // المستطيل الذي يمثل التايمر
    var timer: Timer? // المؤقت
    var timeRemaining: Int = 20 // الوقت المتبقي للمؤقت
    var isTimerStarted = false // متغير لتحديد ما إذا كان التايمر قد بدأ
    
    private var popupContainer: SKNode!
    private var characterContainer: SKNode!

    // Audio players
    var coverYourEyePlayer: AVAudioPlayer?
    var focusAndTryPlayer: AVAudioPlayer?

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = CGSize(width: size.width, height: size.height)
        background.zPosition = -1
        addChild(background)
        
        loadSounds() // Load sounds
        showPopup()

        // زر الهوم
        let button = SKSpriteNode(imageNamed: "homeBotton")
        button.name = "button" // اسم الزر لتحديد الأكشن
        button.size = CGSize(width: 100, height: 100) // الحجم النسبي
        button.position = CGPoint(x: 70, y: 720)
        button.zPosition = 1
        addChild(button)

        // إنشاء القلوب في أعلى المنتصف
        let heartSpacing: CGFloat = 10.0 // المسافة بين القلوب
        let heartWidth: CGFloat = size.width * 0.05 // عرض القلب النسبي
        let totalHeartsWidth = CGFloat(lives) * heartWidth + CGFloat(lives - 1) * heartSpacing

        for i in 0..<lives {
            let heart = SKSpriteNode(imageNamed: "heart")
            heart.size = CGSize(width: heartWidth * 1.2, height: heartWidth * 1.2) // جعل القلب الممتلئ أكبر بنسبة 20%
            heart.position = CGPoint(x: CGFloat(600 + (i * 70)), y: 700) // 50px padding from top
            heart.zPosition = 2
            addChild(heart)
            hearts.append(heart)
        }

        // إضافة الفريم في أقصى اليمين
        let frame = SKSpriteNode(imageNamed: "frame")
        frame.size = CGSize(width: size.width * 0.25, height: size.height * 0.1) // حجم الفريم
        frame.position = CGPoint(x: 1000, y: 700)
        frame.zPosition = 1
        addChild(frame)

        // إضافة المستطيل الذي يمثل التايمر
        let rectPath = CGPath(roundedRect: CGRect(x: -195, y: -68, width: 205, height: 46), cornerWidth: 17, cornerHeight: 17, transform: nil)
        timerRectangle = SKShapeNode(path: rectPath)
        timerRectangle.fillColor = SKColor(hex: 0xAC5848) // Desired color
        timerRectangle.lineWidth = 0 // Set border width to zero to make it borderless
        timerRectangle.position = CGPoint(x: 1068, y: 745) // Adjust position above the frame
        timerRectangle.zPosition = 2
        addChild(timerRectangle)
    }

    // Load sounds
    func loadSounds() {
        coverYourEyePlayer = loadSound(named: "CoverYourEye")
        focusAndTryPlayer = loadSound(named: "FocusandTry")
    }

    private func loadSound(named name: String) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Sound file \(name) not found")
            return nil
        }
        do {
            return try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error loading sound \(name): \(error.localizedDescription)")
            return nil
        }
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

    private func showPopup() {
        popupContainer = SKNode()
        popupContainer.zPosition = 2
        addChild(popupContainer)

        let popupImage = SKSpriteNode(imageNamed: "img7")
        popupImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        popupImage.zPosition = 2
        popupContainer.addChild(popupImage)

        let character = SKSpriteNode(imageNamed: "img2")
        character.position = CGPoint(x: size.width * 0.4, y: size.height * 0.55)
        character.zPosition = 3
        popupContainer.addChild(character)

        let textBubble = SKSpriteNode(imageNamed: "img3")
        textBubble.position = CGPoint(x: size.width * 0.6, y: size.height * 0.6)
        textBubble.zPosition = 3
        popupContainer.addChild(textBubble)

        // Play the sound for img3
        coverYourEyePlayer?.play()

        let playButton = SKSpriteNode(imageNamed: "img5")
        playButton.position = CGPoint(x: size.width / 2, y: size.height * 0.22)
        playButton.zPosition = 3
        playButton.name = "playButton"
        popupContainer.addChild(playButton)
    }

    private func showCharacterAndMessage() {
        characterContainer = SKNode()
        characterContainer.zPosition = 3
        addChild(characterContainer)

        let character = SKSpriteNode(imageNamed: "img2")
        character.position = CGPoint(x: size.width * 0.2, y: size.height * 0.2)
        character.zPosition = 3
        characterContainer.addChild(character)

        let message = SKSpriteNode(imageNamed: "img4")
        message.position = CGPoint(x: size.width * 0.4, y: size.height * 0.25)
        message.zPosition = 5
        characterContainer.addChild(message)

        // Play the sound for img4
        focusAndTryPlayer?.play()

        let wait = SKAction.wait(forDuration: 5.0)
        let remove = SKAction.run { [weak self] in
            self?.characterContainer.removeFromParent()
        }
        characterContainer.run(SKAction.sequence([wait, remove]))
    }

    // تحديد مكان اللمس
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)

            if touchedNode.name == "playButton" {
                popupContainer.removeFromParent()

                // Show the character and wait 5 seconds before starting the star movement
                showCharacterAndMessage()

                let wait = SKAction.wait(forDuration: 5.0)
                let startMovement = SKAction.run { [weak self] in
                    self?.startStarMovement()
                }
                run(SKAction.sequence([wait, startMovement]))
            }

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

    func startStarMovement() {
        let character = SKSpriteNode(imageNamed: "star")
        character.name = "character"
        character.size = CGSize(width: 200, height: 200)
        character.position = CGPoint(x: 600, y: 400)
        character.zPosition = 1
        character.alpha = 1.0
        addChild(character)

        let move1 = SKAction.move(to: CGPoint(x: 100, y: 400), duration: 5)
        let move2 = SKAction.move(to: CGPoint(x: 800, y: 500), duration: 5)
        let move3 = SKAction.move(to: CGPoint(x: 100, y: 600), duration: 5)
        let move4 = SKAction.move(to: CGPoint(x: 900, y: 500), duration: 5)
        let move5 = SKAction.move(to: CGPoint(x: 100, y: 400), duration: 5)
        let move6 = SKAction.move(to: CGPoint(x: 900, y: 300), duration: 5)
        let move7 = SKAction.move(to: CGPoint(x: 400, y: 250), duration: 5)
        let join = SKAction.sequence([move1, move2, move3, move4, move5, move6, move7])

        character.run(join) { [weak self] in
            self?.startTimer()
        }
    }

    func buttonAction() {
        let back = HomeScene(size: size)
        back.scaleMode = .resizeFill
        self.view?.presentScene(back, transition: SKTransition.fade(withDuration: 0.5))
    }

    func winpage() {
        let move = page1(size: size)
        move.scaleMode = .resizeFill
        self.view?.presentScene(move, transition: SKTransition.fade(withDuration: 0.5))
    }

    func loseLife() {
        if lives > 0 {
            lives -= 1
            let heart = hearts[lives]
            heart.removeFromParent()

            let emptyHeart = SKSpriteNode(imageNamed: "emptyheart")
            emptyHeart.size = CGSize(width: heart.size.width * 0.8, height: heart.size.height * 0.8)
            emptyHeart.position = heart.position
            emptyHeart.zPosition = 2
            addChild(emptyHeart)

            hearts[lives] = emptyHeart
        }
        if lives == 0 {
            goToGameOverScene()
        }
    }

    func goToGameOverScene() {
        let gameOverScene = page2(size: size)
        gameOverScene.scaleMode = .resizeFill
        self.view?.presentScene(gameOverScene, transition: SKTransition.fade(withDuration: 0.5))
    }
}


struct RoqaaLevel1View: View {
    var body: some View {
        SpriteView(scene: {
            let scene = RoqaaLevel1(size: CGSize(width: 300, height: 400))
            scene.size = UIScreen.main.bounds.size
            scene.scaleMode = .resizeFill
            return scene
        }())
        .ignoresSafeArea()
    }
}

#Preview {
    RoqaaLevel1View()
}
