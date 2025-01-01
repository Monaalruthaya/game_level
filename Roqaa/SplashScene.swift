//
//  SplashScene.swift
//  game_level1
//
//  Created by mona alruthaya on 24/06/1446 AH.
//

//import SpriteKit
//import SwiftUI
//
//class SplashScene: SKScene {
//    
//    override func didMove(to view: SKView) {
//        setupScene()
//        
//        // Transition to HomeScene after 3 seconds
//        let waitAction = SKAction.wait(forDuration: 3.0)
//        let transitionAction = SKAction.run { [weak self] in
//            guard let self = self else { return }
//            
//            // Transition to HomeScene
//            let homeScene = RoqaaLevel2(size: self.size)
//
//            homeScene.scaleMode = .aspectFill
//            self.view?.presentScene(homeScene, transition: SKTransition.fade(withDuration: 1.0))
//        }
//        run(SKAction.sequence([waitAction, transitionAction]))
//    }
//
//    private func setupScene() {
//        // Ensure the background node is configured correctly
//        if let background = childNode(withName: "D") as? SKSpriteNode {
//            background.size = self.size
//        }
//        
//        let nodeNames = ["circle", "happy", "star", "eyepatch", "innerframe"]
//        for name in nodeNames {
//            if let node = childNode(withName: name) as? SKSpriteNode {
//                // Add text to the innerframe
//                if name == "innerframe" {
//                    let label = SKLabelNode(text: "رقعة")
//                    label.fontName = "Helvetica"
//                    label.fontSize = 80
//                    label.fontColor = SKColor(red: 0.502, green: 0.2, blue: 0.0, alpha: 1.0) // Color #803300
//                    label.position = CGPoint(x: 0, y: -label.fontSize / 4)
//                    node.addChild(label)
//                }
//            }
//        }
//    }
//}
//
//// SwiftUI component to display SplashScene
//struct SplashSceneView: View {
//    var body: some View {
//        SpriteView(scene: {
//            let scene = SplashScene(fileNamed: "SplashScene")! // Load the scene from .sks file
//            scene.size = UIScreen.main.bounds.size // Use screen size
//            scene.scaleMode = .resizeFill // Adjust as necessary
//            return scene
//        }())
//        .ignoresSafeArea() // Fill the screen
//    }
//}
//
//#Preview {
//    SplashSceneView()
//}
import SpriteKit
import SwiftUI
class SplashScene: SKScene {
    override func didMove(to view: SKView) {
        // Set the background color
        backgroundColor = .white
        
        // Load the splash image
        let splashImage = SKSpriteNode(imageNamed: "splashwithname") // Ensure the name matches the asset
        //splashImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        splashImage.size = CGSize(width: size.width, height: size.height) // Adjust size to fit the screen
        
        addChild(splashImage) // Add the splash image to the scene
        
        // Transition to HomeScene after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Wait 3 seconds
            let homeScene = RoqaaLevel1(size: self.size) // Initialize HomeScene
            homeScene.scaleMode = .aspectFill
            
            // Add a transition effect
            let transition = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(homeScene, transition: transition)
        }
    }
}
struct SplashSceneView: View {
    var body: some View {
        SpriteView(scene: {
            let scene = SplashScene(fileNamed: "SplashScene")!
            scene.size = UIScreen.main.bounds.size
            scene.scaleMode = .resizeFill
            return scene
        }())
        .ignoresSafeArea()
    }
}

#Preview {
    SplashSceneView()
}
//new
