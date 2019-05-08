//
//  GameScene.swift
//  Pursuit
//
//  Created by NATHAN SKEENS on 4/25/19.
//  Copyright © 2019 clc.skeens. All rights reserved.
//
// walter
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var player = SKSpriteNode(imageNamed: "stickman2")
    
    var ground = SKSpriteNode()
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        createGrounds() 
        createDude()
}
    override func update(_ currentTime: CFTimeInterval) {
        moveGround()
    }
    
        func createGrounds(){
            
            for i in 0...3{
                
                
                let ground = SKSpriteNode(imageNamed: "Ground-PNG-HD")
                ground.name = "Ground"
                ground.size = CGSize(width: (self.scene?.size.width)!, height: 250)
                ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 2))
                
                self.addChild(ground)
            }
            }
            
            func moveGround(){
                self.enumerateChildNodes( withName: "Ground", using: ({
                    (node, error) in
                       node.position.x -= 2
                    if node.position.x < -((self.scene?.size.width)!) {
                        
                    
                        node.position.x += (self.scene?.size.width)! * 3
                    }
                    
                }))
                
                
                
                
                
            }
    func createDude(){
        player.position = CGPoint(x: 50 , y: 50)
        player.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width: player.size.width, height: player.size.height))
        player.physicsBody?.affectedByGravity
        player.physicsBody?.pinned = true
        player.scale(to: CGSize(width: 100, height: 100))
        addChild(player)
    }
    
            
        }
        
    

