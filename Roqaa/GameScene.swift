//
//  GameScene.swift
//  game_level1
//
//  Created by رشا القرني on 11/06/1446 AH.
//
import GameplayKit
import SpriteKit
import UIKit // لاحط خاصيه اهتزاز

class GameScene: SKScene {
    //هنا نعرف المتغيرات
    var lives: Int = 3 // عدد القلوب
        var hearts: [SKSpriteNode] = [] // مصفوفة لعرض القلوب لان بسوي لوب وتصير اكثر من وحده وابي كلهم ينعرضون نفس الوقت

    override func didMove(to view: SKView) {
        //بسوي زر الهوم
        let button = SKSpriteNode(imageNamed: "homeBotton")
        button.name = "button" //لازم اعطيه اسم علشان احط له اكشن
        button.position = CGPoint(x: -340, y: 470)
        button.size = CGSize(width: 100, height: 100)
        button.zPosition = 1
        addChild(button)
        
        
        
        
        // إنشاء القلوب
               for i in 0..<3 {   // لان اعرف عدد قلوب حددت لوب
                   let heart = SKSpriteNode(imageNamed: "heart")  // حطيت صوره للمتغير
                   heart.size = CGSize(width: 50, height: 50)
                   heart.position = CGPoint(x: CGFloat(60 + (i * 60)), y: 500) // الارتفاع ثابت بس العرض ابي قلب الاول يبعد عن مكان قلب الثاني بمسافه ٦٠ وحرف اي يعبر عن مكان متغير الاول
                   heart.zPosition = 2 // ابي القلوب تكون فوق كل ما كبر رقم كل ما كان فوق كل
                   addChild(heart)
                   hearts.append(heart) // إضافة القلوب للمصفوفة
               }
        
        
        //ثانيا  بحط الشخصيه مع خصائصها في متغير
        let character = SKSpriteNode(imageNamed: "star")
        character.name = "character"
        character.position = CGPoint(x: 0, y: 90)
        character.size = CGSize(width: 200, height: 200)
        
        character.zPosition = 1  // ذا كود لاخلي شخصيه فوق الخلفيه
        character.alpha = 1.0 //ذا كود لاتاكد ان شخصيه موب شفافه
        addChild(character)
        
        // اللحين بحط الحركه للشخصيه
        let move1 = SKAction.move(to: CGPoint(x: 300, y:  90), duration: 1.0)
        let move2 = SKAction.move(to: CGPoint(x: 0, y:  90), duration: 1.0)
        let move3 = SKAction.move(to: CGPoint(x: -300, y:  90), duration: 1.0)
        let move4 = SKAction.move(to: CGPoint(x: 0, y:  90), duration: 1.0)
        let move5 = SKAction.move(to: CGPoint(x: 0, y:  250), duration: 1.0)
        let move6 = SKAction.move(to: CGPoint(x: 0, y:  -150), duration: 1.0)
        let move7 = SKAction.move(to: CGPoint(x: 300, y:  -210), duration: 1.0)
        let join = SKAction.sequence([move1, move2, move3, move4, move5, move6, move7])
        character.run(join)
        
    }
    
    
    
    //لازم كل فونكشن تكون خارج فونكشن اللي تحت اسم كلاس
    
    //سويت فونكشن لتاخذ مكان اللمسه وتشوف اذا كان عند الزر هوم  او عند شخصيه حقتي
    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "button" {
                
                // استدعيت فونكشن للرجوع لصفحه هوم
                buttonAction()
            }
            if touchedNode.name == "character" {
                
                // استدعيت فونكشن للنقل لصفحه فوز
                winpage()
            }
            else{
                loseLife()
                
                let generator = UIImpactFeedbackGenerator(style: .medium) // عرفت متغير واستدعيت ميثود خاصه بالاهتزازات وحيت درجه الاهتزت ميديم وفيه اصلا ٣ انواع .light, .medium, .heavy.
                generator.impactOccurred() // ذا يجعل الاهزاز فعلي لما استدعي كود الاهتزاز
                            
            }
        }
    }
    
    func buttonAction() {
        // الانتقال إلى المشهد الجديد
        let back = homee(size: size) // عرفت متغير يحمل قيمه صفحه الهوم
        
        back.scaleMode = .resizeFill  // حطيت ان ابي صفحه الهوم تنعرض ع شاشه ككل
        self.view?.presentScene(back, transition: SKTransition.fade(withDuration: 0.5)) // الانتقال للصفحه ثانيه( وترا ذا يسمى بالمشهد) مع تأثير التلاشي
    }
    
    
    func winpage() {
        // الانتقال إلى المشهد الجديد
        let move = homee(size: size) // غيريه لاسم صفحه الفوز بدل homee
        
        move.scaleMode = .resizeFill
        self.view?.presentScene(move, transition: SKTransition.fade(withDuration: 0.5))
    }
    
    // حرفيا ذا فونكشن كل اللي تسويه ان تنقص القلب حيث كل مره يضغط الشاشه راح يستدعي ذي فونكشن
    func loseLife() {
            if lives > 0 {
                lives -= 1
                
                hearts[lives].removeFromParent() // إزالة القلب من الشاشة
                          }

            // إذا انتهت القلوب
            if lives == 0 {
                goToGameOverScene()
            }
        }
    func goToGameOverScene() {
           let gameOverScene = homee(size: size) // إنشاء مشهد الخسارة
        gameOverScene.scaleMode = .resizeFill
           self.view?.presentScene(gameOverScene, transition: SKTransition.fade(withDuration: 0.5))
       }
   }

