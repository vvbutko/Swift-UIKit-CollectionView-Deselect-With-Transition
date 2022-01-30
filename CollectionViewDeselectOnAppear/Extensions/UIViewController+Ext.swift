//
//  UIViewController+Ext.swift
//  CollectionViewDeselectOnAppear
//
//  Created by Vladimir Butko on 2022-01-30.
//

import UIKit

extension UIViewController {
    func deselectItem(withTransition: Bool = true, collectionView: UICollectionView?) {
        guard let collectionView = collectionView else { return }
        
        if let indexPath = collectionView.indexPathsForSelectedItems?.first {
            if withTransition, let coordinator = transitionCoordinator {
                coordinator.animate(alongsideTransition: { context in
                    collectionView.deselectItem(at: indexPath, animated: true)}) { context in
                        if context.isCancelled {
                            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
                        }
                    }
            } else {
                collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
    }
}

