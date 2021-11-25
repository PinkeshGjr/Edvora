//
//  CustomTextField.swift
//  Edvora (iOS)
//
//  Created by  on 24/11/21.
//

import Foundation
import SwiftUI
import MaterialComponents

struct CustomTextField: UIViewRepresentable {
    let title: String
    var image: String
    @Binding var textInput : String
    
    
    func makeUIView(context: Context) -> MDCOutlinedTextField {
        let textField = MDCOutlinedTextField()
        textField.setOutlineColor(.lightGray, for: .normal)
        textField.setOutlineColor(.brown, for: .editing)
        textField.leadingViewMode = .always
        textField.containerRadius = 10
        textField.label.textColor = .lightGray
        textField.delegate = context.coordinator
        textField.setLeadingAssistiveLabelColor(.red, for: .normal)
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.allEditingEvent(_:)), for: .allEditingEvents)
        return textField
    }
    
    func updateUIView(_ uiView: MDCOutlinedTextField, context: Context) {
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        let attributedQuote = NSAttributedString(string: title, attributes: attributes)
        uiView.attributedPlaceholder = attributedQuote
        uiView.label.text = title
        
        let view =  UIImageView(image: UIImage(named: image))
        uiView.leadingView = view
        uiView.sizeToFit()
    }
    
    func makeCoordinator() -> CustomTextField.Coordinator {
        Coordinator(parent: self)
    }
    
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField
        
        init(parent: CustomTextField) {
            self.parent = parent
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
           // parent. = textField.text ?? ""
        }
        @objc func allEditingEvent(_ textField: UITextField) {
            parent.textInput = textField.text ?? ""
        }
    }
}
struct CustomPasswordTextField: UIViewRepresentable {
    let title: String

    init(_ title: String) {
        self.title = title
    }
    
    func makeUIView(context: Context) -> MDCOutlinedTextField {
        let textField = MDCOutlinedTextField()
        textField.setOutlineColor(.lightGray, for: .normal)
        textField.setOutlineColor(.brown, for: .editing)
        textField.leadingViewMode = .always
        textField.trailingViewMode = .always
        textField.containerRadius = 10
        textField.isSecureTextEntry = true
        textField.label.textColor = .lightGray
        return textField
    }
    
    func updateUIView(_ uiView: MDCOutlinedTextField, context: Context) {
        uiView.placeholder = title
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        let attributedQuote = NSAttributedString(string: title, attributes: attributes)
        uiView.attributedPlaceholder = attributedQuote
        uiView.label.text = title
        
        let view =  UIImageView(image: UIImage(named: "key"))
        uiView.leadingView = view
        let viewEye =  UIImageView(image: UIImage(named: "eye"))
        uiView.trailingView = viewEye
        uiView.sizeToFit()
    }
}
