//
//  StatefulView.swift
//  GitIt
//
//  Created by Loay Ashraf on 27/12/2021.
//

import UIKit

protocol StatefulView: UIView {
    
    var state: ViewState { get set }
    
    func transition(to viewState: ViewState)
    func render(_ viewState: ViewState)
    func showEmpty(for model: EmptyViewModel)
    func hideEmpty()
    func showActivityIndicator(for loadingViewState: LoadingViewState)
    func hideActivityIndicator(for loadingViewState: LoadingViewState)
    func showError(for failedViewState: FailedViewState)
    func hideError(for failedViewState: FailedViewState)
    
}

extension StatefulView {
    
    func showEmpty(for model: EmptyViewModel) {
        fatalError("This View cannot show empty state")
    }
    
    func hideEmpty() {
        fatalError("This View cannot show empty state, hence cannot hide it.")
    }
    
}
