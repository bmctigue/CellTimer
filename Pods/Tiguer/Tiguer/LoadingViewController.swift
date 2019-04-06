//
//  LoadingViewController.swift
//  Tiguer
//
//  Created by John Sundell on 1/2/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    private lazy var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    private lazy var alphaBackgroundView = UIView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.addActivityIndicator()
        self.addTranspBackground()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // We use a 0.5 second delay to not show an activity indicator
        // in case our data loads very quickly.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.activityIndicator.startAnimating()
            self?.alphaBackgroundView.alpha = 0.5
        }
    }
    
    func addActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    func addTranspBackground() {
        let size = Double(100)
        alphaBackgroundView.frame.size = CGSize(width: size, height: size)
        alphaBackgroundView.backgroundColor = UIColor.black
        alphaBackgroundView.alpha = 0
        alphaBackgroundView.layer.cornerRadius = 8
        alphaBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(alphaBackgroundView)
        self.view.sendSubviewToBack(alphaBackgroundView)
        
        self.view.addConstraint(NSLayoutConstraint(item: alphaBackgroundView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 1))
        self.view.addConstraint(NSLayoutConstraint(item: alphaBackgroundView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 1))
        alphaBackgroundView.addConstraint(NSLayoutConstraint(item: alphaBackgroundView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(size)))
        alphaBackgroundView.addConstraint(NSLayoutConstraint(item: alphaBackgroundView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(size)))
    }
}
