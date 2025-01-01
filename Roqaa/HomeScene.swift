//
//  HomeScene.swift
//  game_level1
//
//  Created by mona alruthaya on 24/06/1446 AH.
//


import SpriteKit
import SwiftUI

class HomeScene: SKScene {
    override func didMove(to view: SKView) {
        // Set the background color
        backgroundColor = .white
        
        // Load the home image
        let homeImage = SKSpriteNode(imageNamed: "home")
        homeImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        homeImage.size = CGSize(width: size.width, height: size.height)
        
        addChild(homeImage)

        // Add text "المستوى الأول"
        let levelText = SKLabelNode(text: "المستوى الأول")
        levelText.fontName = "SFArabicRounded-Bold"
        levelText.fontSize = 50
        levelText.fontColor = UIColor(red: 0.502, green: 0.2, blue: 0.0, alpha: 1.0)
        levelText.position = CGPoint(x: size.width / 2, y: size.height * 0.7)
        levelText.position.x += 300
        levelText.position.y += 135
        
        levelText.zPosition = 1
        addChild(levelText)
        levelText.accessibilityHint = "رقم المستوى" // Hint for VoiceOver

        // Create a play button as an SKSpriteNode
        let playButton = SKSpriteNode(imageNamed: "Play")
        playButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        playButton.position.x += 4.701
        playButton.position.y += 24.659

        playButton.name = "playButton" // Name for touch detection
        playButton.size = CGSize(width: 100, height: 100)
        
        // إضافة نص التعليق الصوتي
        playButton.accessibilityLabel = "زر اللعب" // Label for VoiceOver
        playButton.accessibilityHint = "اضغط للبدء في اللعب" // Hint for VoiceOver
        
        addChild(playButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = atPoint(location)
        
        // Check if the play button was tapped
        if node.name == "playButton" {
            print("Play button tapped")
            
            // Create the new scene
            let roqaaLevel1Scene = RoqaaLevel1(size: self.size)
            roqaaLevel1Scene.scaleMode = .resizeFill
            
            // Transition to the new scene
            let transition = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(roqaaLevel1Scene, transition: transition)
        }
    }
}

// SwiftUI component to display HomeScene
struct HomeSceneView: View {
    var body: some View {
        SpriteView(scene: {
            let scene = HomeScene(size: CGSize(width: 300, height: 400))
            scene.scaleMode = .resizeFill
            return scene
        }())
        .ignoresSafeArea()
    }
}

// Preview for HomeSceneView
struct HomeSceneView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSceneView()
    }
}
