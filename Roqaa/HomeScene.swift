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
        setupScene()
    }
    
    private func setupScene() {
        // Load the background node
   
            // Load the scene from the .sks file
            if let background = childNode(withName: "Desert") as? SKSpriteNode {
                background.size = self.size
            
            
            let nodeNames = ["Oval", "outerframe", "winner", "happyfox", "sa"]
            for name in nodeNames {
                if let node = childNode(withName: name) as? SKSpriteNode {
                    // Add text to the innerframe
                    if name == "outerframe" {
                        let label = SKLabelNode(text: "المستوى الأول")
                        label.fontName = "Helvetica"
                        label.fontSize = 50
                        label.fontColor = SKColor(red: 0.502, green: 0.2, blue: 0.0, alpha: 1.0) // Color #803300
                        label.position = CGPoint(x: -35, y: -label.fontSize / 6)
                        node.addChild(label)
                    }
                }
            }
        }
        
        // Load the play button node
        if childNode(withName: "Play") is SKSpriteNode {

        }
        // You can add more nodes here if needed
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = atPoint(location)
        
        // Check for PlayButton interaction
        if node.name == "PlayButton" {
            print("Play Button Pressed")
            // Add functionality to start the game or navigate to another scene
        }
    }
}





// SwiftUI component to display HomeScene
struct HomeSceneView: View {
    var body: some View {
        SpriteView(scene: {
            let scene = HomeScene(fileNamed: "HomeScene")! // Load the scene from .sks file
            scene.size = UIScreen.main.bounds.size // Adjust size as needed
            scene.scaleMode = .aspectFill // Ensure the scene fills the screen
            return scene
        }())
        .ignoresSafeArea() // Fill the screen
    }
}

#Preview {
    HomeSceneView()
}
