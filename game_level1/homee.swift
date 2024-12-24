//
//  homee.swift
//  game_level1
//
//  Created by رشا القرني on 17/06/1446 AH.
//

import SpriteKit

class homee: SKScene {
    override func didMove(to view: SKView) {
        // إعداد خلفية المشهد الجديد
        backgroundColor = .green

        // إضافة نص في منتصف الشاشة
        let label = SKLabelNode(text: "Welcome to the New Scene!")
        label.fontSize = 40
        label.fontColor = .white
        label.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(label)
    }
}
