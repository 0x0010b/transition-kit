//
//  TKTransitionManager.swift
//  TransitionKit
//
//  Created by 0x0010b on 2/9/20.
//

import UIKit

final public class TKTransitionManager {
    
    // MARK: - Singleton
    
    public static var shared = TKTransitionManager()
    
    // MARK: - Properties
    
    private var transitions = [TKTransitionAnimation]()
    
    // MARK: - Initialization
    
    private init() { }
    
    // MARK: - Methods
    
    internal func instantiate(from fromVC: UIViewController, to toVC: UIViewController, operation: UINavigationControllerOperation)-> UIViewControllerAnimatedTransitioning? {
        
        guard let animation = self.transitions.first(where: { (configurator) -> Bool in
            
            let isPush          = fromVC.isKind(of: configurator.origin) && toVC.isKind(of: configurator.destination) && operation == .push
            let isPop           = fromVC.isKind(of: configurator.destination) && toVC.isKind(of: configurator.origin) && operation == .pop
            let hasOperation    = configurator.operations.contains(operation)
            
            return (isPush || isPop) && hasOperation
            
        }) else {
            return nil
        }
        
        return TKTransition(from: fromVC, to: toVC, operation: operation, animation: animation)
    }
    
    public func add(_ transitions: TKTransitionAnimation...) {
        self.transitions.append(contentsOf: transitions)
    }
}
