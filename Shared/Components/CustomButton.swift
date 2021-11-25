//
//  CustomButton.swift
//  Edvora (iOS)
//
//  Created by  on 24/11/21.
//

import SwiftUI
import MaterialComponents
struct CustomButton: UIViewRepresentable {
    let title: String
    init(_ title: String) {
        self.title = title
    }
    
    func makeUIView(context: Context) -> MDCButton {
        let button = MDCButton()
        button.backgroundColor = UIColor(named: "color-theme")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        return button
    }
    
    func updateUIView(_ uiView: MDCButton, context: Context) {
        uiView.setTitle(title, for: .normal)
    }
}
