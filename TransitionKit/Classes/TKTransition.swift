//
//  TKTransition.swift
//  TransitionKit
//
//  Created by 0x0010b on 2/9/20.
//

import UIKit

final internal class TKTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
    
    private var origin      : UIViewController!
    private var destination : UIViewController!
    private var operation   : UINavigationController.Operation!
    private var animation   : TKTransitionAnimation!
    
    // MARK: - Initialization
    
    init(from fromVC: UIViewController, to toVC: UIViewController, operation: UINavigationController.Operation, animation: TKTransitionAnimation) {
        
        self.origin       = fromVC
        self.destination  = toVC
        self.operation    = operation
        self.animation    = animation
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    internal func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.animation.transitionDuration(using: transitionContext)
    }

    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        switch self.operation {
        case .push:
            self.animation.transitionPush(using: transitionContext)
        case .pop:
            self.animation.transitionPop(using: transitionContext)

        default:
            break
        }
    }
}
