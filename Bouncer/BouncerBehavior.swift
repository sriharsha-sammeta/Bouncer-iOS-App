//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by Sriharsha Sammeta on 19/04/15.
//  Copyright (c) 2015 Sriharsha Sammeta. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    lazy var collider:UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
        }()
    
    lazy var BlockBehaviour:UIDynamicItemBehavior = {
        let lazilyCreatedBlockBehaviour = UIDynamicItemBehavior()
        lazilyCreatedBlockBehaviour.allowsRotation = false
        lazilyCreatedBlockBehaviour.elasticity = 0.85
        lazilyCreatedBlockBehaviour.friction = 0
        lazilyCreatedBlockBehaviour.resistance = 0
        return lazilyCreatedBlockBehaviour
        }()
    
    override init(){
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(BlockBehaviour)
    }
    
    func addBarrier(path: UIBezierPath,named name:String){
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(Block:UIView){
        dynamicAnimator?.referenceView?.addSubview(Block)
        gravity.addItem(Block)
        collider.addItem(Block)
        BlockBehaviour.addItem(Block)
    }
    func removerBlock(Block:UIView){
        gravity.removeItem(Block)
        collider.removeItem(Block)
        BlockBehaviour.removeItem(Block)
        Block.removeFromSuperview()
    }
    

}
