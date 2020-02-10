//
//  TKNavigationManager.swift
//  TransitionKit
//
//  Created by 0x0010b on 2/9/20.
//

import UIKit

final public class TKNavigationManager: NSObject, UINavigationControllerDelegate {
    
    // MARK: - UINavigationControllerDelegate
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TKTransitionManager.shared.instantiate(from: fromVC, to: toVC, operation: operation)
    }
}
