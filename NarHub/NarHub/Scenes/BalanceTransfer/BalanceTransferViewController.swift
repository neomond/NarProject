//
//  BalanceTransferViewController.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 28.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BalanceTransferDisplayLogic: AnyObject {
    func displayBalanceTransfer(viewModel: BalanceTransfer.FetchOptions.ViewModel)
    func displayError(errorMessage: String)
}

class BalanceTransferViewController: UIViewController, BalanceTransferDisplayLogic {
   
    var mainView: BalanceTransferView?
    
    var interactor: BalanceTransferBusinessLogic?
    
    var router: (NSObjectProtocol & BalanceTransferRoutingLogic & BalanceTransferDataPassing)?
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.load()
        
        self.view = mainView
        setupNavigationBar()
//        fetchTransferredAmounts()
    }
    
    
    
    private func setupNavigationBar() {
        self.title = "Balans köçürmə"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        appearance.backgroundColor = UIColor(.white)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    
    
    // MARK: Do something
    func load() {
        let request = BalanceTransfer.FetchOptions.Request()
        interactor?.fetchBalanceTransfer(request: request)
    }
    
    func displayBalanceTransfer(viewModel: BalanceTransfer.FetchOptions.ViewModel) {
        mainView?.updateTransferredAmounts(viewModel.balanceTransferDisplay)
        
    }
    
    
    func displayError(errorMessage: String) {
        print(errorMessage)
    }
    
}
