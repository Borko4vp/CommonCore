//
//  BaseViewController.swift
//  CommonCore
//
//  Created by Borko Tomic on 21/11/2020.
//

import Foundation
import UIKit


public extension CommonCore.UI {
    class BaseViewController: UIViewController, LoadingController, KeyboardPresentable, BaseController {
        
        var interactivePopGestureRecognizerEnabled: Bool {
            return true
        }
        
        var loadingViewController: LoadingViewController?
        var keyboardPresenter: KeyboardPresenter!
        
        
        public override func viewDidLoad() {
            super.viewDidLoad()
            
            configureKeyboardPresenter()
        }
        
        public override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            keyboardPresenter.registerForKeyboardNotifications()
        }
        
        public override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            navigationController?.interactivePopGestureRecognizer?.isEnabled = interactivePopGestureRecognizerEnabled
        }
        
        public override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            keyboardPresenter.unregisterKeyboardNotifications()
        }
        
//        func pushViaMain(controller: BaseController) {
//            if let mainParent = parent as? MainViewController {
//                mainParent.push(controller: controller)
//            }
//        }
        
        func showLoading() {
            loadingViewController = LoadingViewController()
            loadingViewController?.modalPresentationStyle = .overCurrentContext
            guard let loadingViewController = loadingViewController else { return }
            self.present(loadingViewController, animated: false, completion: nil)
        }
        
        func hideLoading(showSuccess: Bool = false, completion: (() -> Void)? = nil) {
             loadingViewController?.dismissLoading(with: showSuccess) {
                self.loadingViewController = nil
                completion?()
            }
        }
        
        func keyboardAboutToShow(keyboardSize: CGRect) {
            // override in each view controller
        }
        
        func keyboardAboutToHide(keyboardSize: CGRect) {
            // override in each view controller
        }
    }
}

