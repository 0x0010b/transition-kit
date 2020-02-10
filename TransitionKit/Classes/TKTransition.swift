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
    private var operation   : UINavigationControllerOperation!
    private var dataSource  : TKTransitionDataSource!
    
    // MARK: - Initialization
    
    init(from fromVC: UIViewController, to toVC: UIViewController, operation: UINavigationControllerOperation, dataSource: TKTransitionDataSource) {
        
        self.origin       = fromVC
        self.destination  = toVC
        self.operation    = operation
        self.dataSource   = dataSource
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    internal func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.dataSource.transitionDuration(using: transitionContext)
    }

    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        switch self.operation {
        case .push:
            self.dataSource.transitionPush(using: transitionContext)
        case .pop:
            self.dataSource.transitionPop(using: transitionContext)

        default:
            break
        }
    }
}
