//
//  HomeScene.swift
//  game_level1
//
//  Created by mona alruthaya on 24/06/1446 AH.
//

//import SpriteKit
//import SwiftUI
//
//class HomeScene: SKScene {
//    
//    override func didMove(to view: SKView) {
//        setupScene()
//    }
//    
//    private func setupScene() {
//        // Load the background node
//   
//            // Load the scene from the .sks file
//            if let background = childNode(withName: "Desert") as? SKSpriteNode {
//                background.size = self.size
//            
//            
//            let nodeNames = ["Oval", "outerframe", "winner", "happyfox", "sa"]
//            for name in nodeNames {
//                if let node = childNode(withName: name) as? SKSpriteNode {
//                    // Add text to the innerframe
//                    if name == "outerframe" {
//                        let label = SKLabelNode(text: "المستوى الأول")
//                        label.fontName = "Helvetica"
//                        label.fontSize = 50
//                        label.fontColor = SKColor(red: 0.502, green: 0.2, blue: 0.0, alpha: 1.0) // Color #803300
//                        label.position = CGPoint(x: -35, y: -label.fontSize / 6)
//                        node.addChild(label)
//                    }
//                }
//            }
//        }
//        
//        // Load the play button node
//        if childNode(withName: "Play") is SKSpriteNode {
//
//        }
//        // You can add more nodes here if needed
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
//        let node = atPoint(location)
//        
//        // Check for PlayButton interaction
//        if node.name == "PlayButton" {
//            print("Play Button Pressed")
//            // Add functionality to start the game or navigate to another scene
//        }
//    }
//}
//
//
//
//
//
//// SwiftUI component to display HomeScene
//struct HomeSceneView: View {
//    var body: some View {
//        SpriteView(scene: {
//            let scene = HomeScene(fileNamed: "HomeScene")! // Load the scene from .sks file
//            scene.size = UIScreen.main.bounds.size // Adjust size as needed
//            scene.scaleMode = .aspectFill // Ensure the scene fills the screen
//            return scene
//        }())
//        .ignoresSafeArea() // Fill the screen
//    }
//}
//
//#Preview {
//    HomeSceneView()
//}
//منى جديد//import SpriteKit
//import SwiftUI
//
//class HomeScene: SKScene {
//    override func didMove(to view: SKView) {
//        setupScene()
//    }
//
//    private func setupScene() {
//        // Set the background if it exists
//        if let background = childNode(withName: "Home") as? SKSpriteNode {
//            background.size = self.size
//        }
//
//        let nodeNames = ["Oval", "outerframe", "winner", "happyfox", "sa"]
//        for name in nodeNames {
//            if let node = childNode(withName: name) as? SKSpriteNode {
//                // Add text to the "outerframe" node
//                if name == "outerframe" {
//                    let label = SKLabelNode(text: "المستوى الأول")
//                    label.fontName = "Helvetica"
//                    label.fontSize = 50
//                    label.fontColor = SKColor(red: 0.502, green: 0.2, blue: 0.0, alpha: 1.0) // Color #803300
//                    label.position = CGPoint(x: -35, y: -label.fontSize / 6)
//                    node.addChild(label)
//                }
//            }
//        }
//
//        // Add Play Button functionality (if exists)
//        if let playButton = childNode(withName: "Play") as? SKSpriteNode {
//            playButton.name = "Play" // Ensure name is set for touch detection
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
//        let node = atPoint(location)
//
//        // Check for PlayButton interaction
//        if node.name == "Play" {
//            print("Play Button Pressed")
//            // Add functionality to navigate to the game or another scene
//        }
//    }
//}
//
//
//
//struct HomeSceneView: View {
//    var body: some View {
//        SpriteView(scene: {
//            let scene = HomeScene(fileNamed: "HomeScene")!
//            scene.size = UIScreen.main.bounds.size
//            scene.scaleMode = .aspectFill
//            return scene
//        }())
//        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    HomeSceneView()
//}
//import SpriteKit
//
//class HomeScene: SKScene {
//
//    override func didMove(to view: SKView) {
//        // Set up the scene
//        backgroundColor = .white
//
//        // Add the background image
//        let background = SKSpriteNode(imageNamed: "Home") // Use the name of your image
//        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
//        background.size = size // Stretch to fit the screen
//        background.zPosition = -1 // Ensure it stays in the background
//        addChild(background)
//
//        // Add the yellow frame
//        let yellowFrame = SKSpriteNode(color: .yellow, size: CGSize(width: size.width * 0.8, height: 60))
//        yellowFrame.position = CGPoint(x: size.width / 2, y: size.height * 0.85) // Adjust the position
//        yellowFrame.zPosition = 1 // Ensure it appears above the background
//        //yellowFrame.cornerRadius = 15 // Optional: rounded edges if supported
//        addChild(yellowFrame)
//
//        // Add text to the yellow frame
//        let label = SKLabelNode(text: "Your Text Here") // Replace with your text
//        label.fontSize = 24
//        label.fontColor = .black
//        label.fontName = "AvenirNext-Bold" // Set your preferred font
//        label.position = CGPoint(x: 0, y: -10) // Centered in the yellow frame
//        yellowFrame.addChild(label)
//
//        // Add the play button
//        let playButton = SKSpriteNode(color: .orange, size: CGSize(width: 100, height: 40))
//        playButton.position = CGPoint(x: yellowFrame.size.width / 3, y: 0) // Align to the right of the frame
//        playButton.name = "playButton" // Set a name for touch detection
//        //playButton.cornerRadius = 10 // Optional: rounded edges
//        yellowFrame.addChild(playButton)
//
//        // Add label to the play button
//        let playLabel = SKLabelNode(text: "Play")
//        playLabel.fontSize = 18
//        playLabel.fontColor = .white
//        playLabel.fontName = "AvenirNext-Bold"
//        playLabel.verticalAlignmentMode = .center
//        playLabel.position = CGPoint(x: 0, y: 0)
//
//
//
//
//        struct SplashSceneView: View {
//            var body: some View {
//                SpriteView(scene: {
//                    let scene = SplashScene(fileNamed: "SplashScene")!
//                    scene.size = UIScreen.main.bounds.size
//                    scene.scaleMode = .resizeFill
//                    return scene
//                }())
//                .ignoresSafeArea()
//            }
//        }
//
//        #Preview {
//            SplashSceneView()
//        }
//
import SpriteKit
import SwiftUI
class HomeScene: SKScene {
    override func didMove(to view: SKView) {
        // Set the background color
        backgroundColor = .white
        
        // Load the home image
        let homeImage = SKSpriteNode(imageNamed: "home") // Ensure the name matches the asset
        homeImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        homeImage.size = CGSize(width: size.width, height: size.height) // Adjust size to fit the screen
        
        addChild(homeImage) // Add the home image to the scene
        
        // Add text "المستوى الأول"
        let levelText = SKLabelNode(text: "المستوى الأول")
        levelText.fontName = "SFArabicRounded-Bold" // Use SF Arabic Rounded font
        levelText.fontSize = 50 // Adjust size
        levelText.fontColor = UIColor(red: 0.502, green: 0.2, blue: 0.0, alpha: 1.0) // Custom color
        levelText.position = CGPoint(x: size.width / 2, y: size.height * 0.7) // Adjust position
        // Apply the offset
                levelText.position.x += 300 // Offset x by 40
                levelText.position.y += 145 // Offset y by 57
        
        levelText.zPosition = 1// Ensure it's above other elements
        addChild(levelText) // Add text to the scene
        
        
        // Create a play button as an SKSpriteNode
                let playButton = SKSpriteNode(imageNamed: "Play") // Use your play button image
                playButton.position = CGPoint(x: size.width / 2, y: size.height / 2) // Position it in the center (adjust as needed)
        playButton.position.x += 4.701
        playButton.position.y += 24.659

                playButton.name = "playButton" // Name for touch detection
                playButton.size = CGSize(width: 100, height: 100) // Set the size of the button (adjust as needed)
                
                addChild(playButton) // Add the play button to the scene
            }
            
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                guard let touch = touches.first else { return }
                let location = touch.location(in: self)
                let node = atPoint(location)
                
                // Check if the play button was tapped
                if node.name == "playButton" {
                    print("Play button tapped")
                    // Add functionality to start the game or navigate to another scene
                }
    }
}

// SwiftUI component to display HomeScene
struct HomeSceneView: View {
    var body: some View {
        SpriteView(scene: {
            let scene = HomeScene(size: CGSize(width: 300, height: 400)) // Set the desired size
            scene.scaleMode = .resizeFill // Adjust as necessary
            return scene
        }())
        .ignoresSafeArea() // Fill the screen
    }
}

// Preview for HomeSceneView
struct HomeSceneView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSceneView() // Use the SwiftUI view for preview
    }
}
//restdyfguhiop[]
