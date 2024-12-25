import SpriteKit
import GameplayKit

class page2: SKScene {
    
    let homeButton = SKSpriteNode(imageNamed: "home")
    let nextButton = SKSpriteNode(imageNamed: "arrow")
    let surpriseNode = SKSpriteNode(imageNamed: "surprise") // صورة الثعلب
    let successLabel = SKLabelNode(fontNamed: "AvenirNext-Bold") // النص
    
    // MARK: - إعداد المشهد
    override func didMove(to view: SKView) {
        
        // 1) ضبط حجم المشهد بحيث يطابق حجم شاشة العرض (مثل المشهد الأول)
        self.size = view.bounds.size
        
        // 2) ضبط الـ scaleMode كما في المشهد الأول (مثلاً aspectFill أو resizeFill)
        self.scaleMode = .aspectFill
        
        // زر الهوم 🏠
        homeButton.name = "homeButton"
        homeButton.position = CGPoint(x: -500, y: 330) // بالقرب من الزاوية العلوية اليسرى
        homeButton.size = CGSize(width: 100, height: 100)
        homeButton.zPosition = 1
        addChild(homeButton)
        
        // البوب-أب 📦
        let popup = SKSpriteNode(imageNamed: "sq")
        popup.size = CGSize(width: 700, height: 400)
        popup.position = CGPoint(x: 0, y: 0)
        popup.zPosition = 2
        addChild(popup)
        
        // الثعلب 🦊
        surpriseNode.name = "surprise"
        surpriseNode.position = CGPoint(x: -160, y: 0)
        surpriseNode.zPosition = 3
        addChild(surpriseNode)
        
        // زر التالي ⏩
        nextButton.name = "nextButton"
        nextButton.position = CGPoint(x: 260, y: -140)
        nextButton.zPosition = 4
        addChild(nextButton)
        
        // النص 📜
        successLabel.text = "حاول مره ثانية!"
        successLabel.fontSize = 25
        successLabel.fontColor = .black // or any other built-in color
        successLabel.position = CGPoint(x: 130, y: 0)
        successLabel.zPosition = 5
        addChild(successLabel)
    }
    
    // تحديد مكان اللمس
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "homeButton" {
                buttonAction()
            } else if touchedNode.name == "nextButton" {
                winpage()
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
}
