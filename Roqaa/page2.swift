import SpriteKit
import GameplayKit
import SwiftUI
import AVFoundation

class page2: SKScene {

    let homeButton = SKSpriteNode(imageNamed: "home")
    let nextButton = SKSpriteNode(imageNamed: "arrow")
    let surpriseNode = SKSpriteNode(imageNamed: "surprise") // صورة الثعلب
    let successLabel = SKLabelNode(fontNamed: "AvenirNext-Bold") // النص

    // Audio player
    var tryAgainPlayer: AVAudioPlayer?

    // MARK: - إعداد المشهد
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = CGSize(width: size.width, height: size.height)
        background.zPosition = -1
        addChild(background)

        // Load the sound
        loadSound()

        // زر الهوم
        let button = SKSpriteNode(imageNamed: "homeBotton")
        button.name = "button" // اسم الزر لتحديد الأكشن
        button.size = CGSize(width: 100, height: 100) // الحجم النسبي
        button.position = CGPoint(x: 70, y: 720)
        button.zPosition = 1
        addChild(button)

        // البوب-أب 📦
        let popup = SKSpriteNode(imageNamed: "sq")
        popup.size = CGSize(width: 700, height: 400)
        popup.position = CGPoint(x: 600, y: 400)
        popup.zPosition = 2
        addChild(popup)

        // الثعلب 🦊
        surpriseNode.name = "surprise"
        surpriseNode.position = CGPoint(x: 400, y: 400)
        surpriseNode.zPosition = 3
        addChild(surpriseNode)

        // زر التالي ⏩
        nextButton.name = "nextButton"
        nextButton.position = CGPoint(x: 850, y: 250)
        nextButton.zPosition = 4
        addChild(nextButton)

        // النص 📜
        successLabel.text = "حاول مره ثانية !"
        successLabel.fontSize = 48
        successLabel.fontColor = .font // Set to a visible color
        successLabel.position = CGPoint(x: 700, y: 390)
        successLabel.zPosition = 5
        addChild(successLabel)

        // Play the sound when the label is displayed
        tryAgainPlayer?.play()
    }

    private func loadSound() {
        guard let url = Bundle.main.url(forResource: "TryAgain", withExtension: "mp3") else {
            print("Sound file TryAgain not found")
            return
        }
        do {
            tryAgainPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error loading sound TryAgain: \(error.localizedDescription)")
        }
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
        let move = RoqaaLevel1(size: size)
        move.scaleMode = .resizeFill
        self.view?.presentScene(move, transition: SKTransition.fade(withDuration: 0.5))
    }
}

struct page2View: View {
    var body: some View {
        SpriteView(scene: {
            let scene = page2(size: CGSize(width: 300, height: 400))
            scene.size = UIScreen.main.bounds.size
            scene.scaleMode = .resizeFill
            return scene
        }())
        .ignoresSafeArea()
    }
}

#Preview {
    page2View()
}
