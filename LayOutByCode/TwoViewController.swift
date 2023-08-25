//
//  TwoViewController.swift
//  LayOutByCode
//
//  Created by Андрей Платунов on 23.08.2023.
//

import UIKit


final class TwoViewController: UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()
    
    var complition: ((String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            button.topAnchor.constraint(equalTo: label.topAnchor, constant: 200),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        button.backgroundColor = .purple
        button.setTitle("BackYard", for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        label.textAlignment = .center
        
        
        view.backgroundColor = .cyan
    }
    
    @objc
    private func back() {
        complition? ("Don't let daddy kiss me to night")
        dismiss(animated: true)
        
    }
    
    func configure(text: String) {
        label.text = text
    }
}
