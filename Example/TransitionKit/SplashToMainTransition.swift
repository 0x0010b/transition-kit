//
//  SplashToMainTransition.swift
//  TransitionKit_Example
//
//  Created by 0x0010b on 2/2/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import TransitionKit

class SplashToMainTransition: TKTransitionDataSource {
    
    var origin      : UIViewController.Type = SplashViewController.self
    var destination : UIViewController.Type = MainViewController.self
    var operations  : [UINavigationControllerOperation] = [.push, .pop]
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func transitionPush(using transitionContext: UIViewControllerContextTransitioning) {
        
        let duration    = self.transitionDuration(using: transitionContext)
        let fromView    = transitionContext.view(forKey: .from)!
        let toView      = transitionContext.view(forKey: .to)!
        let container   = transitionContext.containerView
        
        container.addSubview(fromView)
        container.addSubview(toView)
        
        toView.transform = CGAffineTransform(translationX: 0, y: -(container.bounds.height))
        
        UIView.animate(withDuration: duration, animations: {
            
            toView.transform    = .identity
            fromView.transform  = CGAffineTransform(translationX: 0, y: container.bounds.height)
            
        }) { (complete) in
            
            fromView.transform  = .identity
            toView.transform    = .identity
            
            transitionContext.completeTransition(complete)
        }
    }
    
    func transitionPop(using transitionContext: UIViewControllerContextTransitioning) {
        
        let duration    = self.transitionDuration(using: transitionContext)
        let fromView    = transitionContext.view(forKey: .from)!
        let toView      = transitionContext.view(forKey: .to)!
        let container   = transitionContext.containerView
        
        container.addSubview(fromView)
        container.addSubview(toView)
        
        toView.transform = CGAffineTransform(translationX: 0, y: container.bounds.height)
        
        UIView.animate(withDuration: duration, animations: {
            
            toView.transform    = .identity
            fromView.transform  = CGAffineTransform(translationX: 0, y: -(container.bounds.height))
            
        }) { (complete) in
            
            fromView.transform  = .identity
            toView.transform    = .identity
            
            transitionContext.completeTransition(complete)
        }
    }

}
