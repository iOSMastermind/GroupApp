//
//  DoneToolbar.swift
//  GroupApp
//
//  Created by Jinu on 30/08/2024.
//

import SwiftUI
import UIKit

struct TextFieldWithToolbar: UIViewControllerRepresentable {
    class Coordinator: NSObject {
        var textField: UITextField?
        
        @objc func doneButtonTapped() {
            textField?.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        
        // Create a UITextField and add it to the view controller's view
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 280, height: 40))
        textField.borderStyle = .roundedRect
        
        // Create a UIToolbar with a Done button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        
        // Set the toolbar as the inputAccessoryView of the textField
        textField.inputAccessoryView = toolbar
        
        // Set the textField reference in the coordinator
        context.coordinator.textField = textField
        
        viewController.view.addSubview(textField)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
}
