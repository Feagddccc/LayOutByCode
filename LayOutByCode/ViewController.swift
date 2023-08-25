//
//  ViewController.swift
//  LayOutByCode
//
//  Created by Андрей Платунов on 22.08.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let label = UILabel()
    private let texField = UITextField()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(texField)
        view.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        texField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            texField.topAnchor.constraint(equalTo: label.topAnchor, constant: 200),
            texField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            texField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            button.topAnchor.constraint(equalTo: texField.topAnchor, constant: 200),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        label.text = "Hi, Gachimuchi dungeon master!"
        label.textAlignment = .center
        
        texField.backgroundColor = .orange
        texField.delegate = self
        
        button.backgroundColor = .purple
        button.setTitle("Forward", for: .normal)
        button.addTarget(self, action: #selector(castTwoVC), for: .touchUpInside)
        view.backgroundColor = .brown
    }

    @objc
    private func castTwoVC() {
        let vc = TwoViewController()
        vc.complition = {
            [weak self] text in
            self?.label.text = text
            self?.texField.text = text
        }
        vc.configure(text: label.text ?? "")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textField (
        _ _textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        label.text = texField.text
        
        return true
    }
}

