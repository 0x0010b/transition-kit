//
//  TKTransitionDataSource.swift
//  TransitionKit
//
//  Created by Felix Chacaltana on 2/9/20.
//

import UIKit

public protocol TKTransitionDataSource {
    
    // MARK: - Properties
    
    var origin      : UIViewController.Type {get set}
    var destination : UIViewController.Type {get set}
    var operations  : [UINavigationControllerOperation] {get set}
    
    // MARK: - Methods
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?)-> TimeInterval
    func transitionPush(using transitionContext: UIViewControllerContextTransitioning)
    func transitionPop(using transitionContext: UIViewControllerContextTransitioning)
}
