//
//  KeyboardPresentable.swift
//  CommonCore
//
//  Created by Borko Tomic on 06/11/2020.
//
import Foundation
import UIKit

protocol KeyboardPresenterProtocol: class {
    func keyboardAboutToShow(keyboardSize: CGRect)
    func keyboardAboutToHide(keyboardSize: CGRect)
}

class KeyboardPresenter {
    private weak var presenter: KeyboardPresenterProtocol!

    init(presenter: KeyboardPresenterProtocol) {
      self.presenter = presenter
      registerForKeyboardNotifications()
    }
    
    func getPresenter() -> KeyboardPresenterProtocol {
        return presenter
    }
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    @objc
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            presenter?.keyboardAboutToShow(keyboardSize: keyboardSize)
          }
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            presenter?.keyboardAboutToHide(keyboardSize: keyboardSize)
          }
    }
}

protocol KeyboardPresentable where Self: KeyboardPresenterProtocol {
   var keyboardPresenter: KeyboardPresenter! { get set }
   func configurePresenter()
}

extension KeyboardPresentable {
   func configurePresenter() {
        keyboardPresenter = KeyboardPresenter(presenter: self)
   }
}
