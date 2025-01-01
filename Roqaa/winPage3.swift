//
//  winPage3.swift
//  Roqaa
//
//  Created by رشا القرني on 25/06/1446 AH.
//


//
//  winPage3.swift
//  Roqaa
//
//  Created by رشا القرني on 25/06/1446 AH.
//

import SpriteKit
import GameplayKit
import SwiftUI
import AVFoundation

class winPage3: SKScene {
    
    let homeButton = SKSpriteNode(imageNamed: "home")
    let foxNode = SKSpriteNode(imageNamed: "fox cele")
    let successLabel = SKLabelNode(fontNamed: "AvenirNext-Bold") // النص

    // Audio player
    var lastDonePlayer: AVAudioPlayer?

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
        foxNode.name = "surprise"
        foxNode.position = CGPoint(x: 400, y: 400)
        foxNode.zPosition = 3
        addChild(foxNode)

        // النص 📜
        successLabel.text = "أحسنت أتممت مهام اليوم!"
        successLabel.fontSize = 27
        successLabel.fontColor = .font // Set to a visible color
        successLabel.position = CGPoint(x: 700, y: 390)
        successLabel.zPosition = 5
        addChild(successLabel)

        // Play the sound when the label is displayed
        lastDonePlayer?.play()
    }

    private func loadSound() {
        guard let url = Bundle.main.url(forResource: "LastDone", withExtension: "mp3") else {
            print("Sound file LastDone not found")
            return
        }
        do {
            lastDonePlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error loading sound LastDone: \(error.localizedDescription)")
        }
    }

    // تحديد مكان اللمس
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)

            if touchedNode.name == "button" {
                buttonAction()
            }
        }
    }

    func buttonAction() {
        let back = HomeScene(size: size)
        back.scaleMode = .resizeFill
        self.view?.presentScene(back, transition: SKTransition.fade(withDuration: 0.5))
    }
}

struct winPage3View: View {
    var body: some View {
        SpriteView(scene: {
            let scene = winPage3(size: CGSize(width: 300, height: 400))
            scene.size = UIScreen.main.bounds.size
            scene.scaleMode = .resizeFill
            return scene
        }())
        .ignoresSafeArea()
    }
}

#Preview {
    winPage3View()
}
