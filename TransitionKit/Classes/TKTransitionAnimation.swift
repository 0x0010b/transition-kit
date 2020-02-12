//
//  TKTransitionAnimation.swift
//  TransitionKit
//
//  Created by 0x0010b on 2/9/20.
//

import UIKit

public protocol TKTransitionAnimation {
    
    // MARK: - Properties
    
    var origin      : UIViewController.Type {get set}
    var destination : UIViewController.Type {get set}
    var operations  : [UINavigationController.Operation] {get set}
    
    // MARK: - Methods
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?)-> TimeInterval
    func transitionPush(using transitionContext: UIViewControllerContextTransitioning)
    func transitionPop(using transitionContext: UIViewControllerContextTransitioning)
}
