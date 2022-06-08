//
//  LifeStyleViewController.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import UIKit

class LifeStyleViewController: UIViewController {
	
	private var viewLayout: ViewLayouts!
	
	private var greetingLabel: UILabel!
	private var introMessageLabel: UILabel!
	private var notificationButton: UIButton!
	private var topSeparator: UIView!
	private var logReadingsView: UIView!
	private var logActivityView: UIView!
	private var logSymptomsView: UIView!
	private var bottomSeparator: UIView!
	private var healthNewsView: UIView!
	
	init(viewLayout: ViewLayouts) {
		self.viewLayout = viewLayout
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupVC()
		setupLayoutConstraints()
    }
  
	func setupVC() {
		greetingLabel = viewLayout.greetingLabel
		introMessageLabel = viewLayout.introMessageLabel
		notificationButton = viewLayout.notificationButton
		topSeparator = viewLayout.separatorView()
		logReadingsView = viewLayout.cardView(image: Constants.Images.log_readings!, title: Constants.LogTitles.log_readings)
		logActivityView = viewLayout.cardView(image: Constants.Images.log_activity!, title: Constants.LogTitles.log_activity)
		logSymptomsView = viewLayout.cardView(image: Constants.Images.log_symptoms!, title: Constants.LogTitles.log_symptoms)
		bottomSeparator = viewLayout.separatorView()
		healthNewsView = viewLayout.healthNewsView()
		
		self.navigationController?.navigationBar.isHidden = true
		
		view.backgroundColor = .white
		view.addSubview(greetingLabel)
		view.addSubview(introMessageLabel)
		view.addSubview(notificationButton)
		
		view.addSubview(topSeparator)
		view.addSubview(logReadingsView)
		view.addSubview(logActivityView)
		view.addSubview(logSymptomsView)
		view.addSubview(bottomSeparator)
		view.addSubview(healthNewsView)
	}
	
	func setupLayoutConstraints() {
		let logCardWidth = view.frame.width / 3.5
		let logCardHeight = (view.frame.width / 3.5) + 10
		NSLayoutConstraint.activate([
			greetingLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
			greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
			greetingLabel.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: 10),
			greetingLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 94),
			greetingLabel.heightAnchor.constraint(equalToConstant: 25),
			
			introMessageLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor),
			introMessageLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
			introMessageLabel.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
			introMessageLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 94),
			introMessageLabel.heightAnchor.constraint(equalToConstant: 50),
			
			notificationButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
			notificationButton.leadingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
			notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
			notificationButton.widthAnchor.constraint(equalToConstant: 50),
			notificationButton.heightAnchor.constraint(equalToConstant: 50),
			
			topSeparator.topAnchor.constraint(equalTo: introMessageLabel.bottomAnchor, constant: 20),
			topSeparator.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
			topSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
			topSeparator.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -34),
			topSeparator.heightAnchor.constraint(equalToConstant: 2),
			
			logReadingsView.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 20),
			logReadingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
			logReadingsView.widthAnchor.constraint(equalToConstant: logCardWidth),
			logReadingsView.heightAnchor.constraint(equalToConstant: logCardHeight),
			
			logActivityView.topAnchor.constraint(equalTo: logReadingsView.topAnchor),
			logActivityView.leadingAnchor.constraint(equalTo: logReadingsView.trailingAnchor, constant: 10),
			logActivityView.widthAnchor.constraint(equalToConstant: logCardWidth),
			logActivityView.heightAnchor.constraint(equalToConstant: logCardHeight),
			
			logSymptomsView.topAnchor.constraint(equalTo: logActivityView.topAnchor),
			logSymptomsView.leadingAnchor.constraint(equalTo: logActivityView.trailingAnchor, constant: 10),
			logSymptomsView.widthAnchor.constraint(equalToConstant: logCardWidth),
			logSymptomsView.heightAnchor.constraint(equalToConstant: logCardHeight),
			logSymptomsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
			
			bottomSeparator.topAnchor.constraint(equalTo: logReadingsView.bottomAnchor, constant: 20),
			bottomSeparator.leadingAnchor.constraint(equalTo: topSeparator.leadingAnchor),
			bottomSeparator.trailingAnchor.constraint(equalTo: topSeparator.trailingAnchor),
			bottomSeparator.widthAnchor.constraint(equalTo: topSeparator.widthAnchor),
			bottomSeparator.heightAnchor.constraint(equalTo: topSeparator.heightAnchor),
			
			healthNewsView.topAnchor.constraint(equalTo: bottomSeparator.bottomAnchor, constant: 20),
			healthNewsView.leadingAnchor.constraint(equalTo: bottomSeparator.leadingAnchor),
			healthNewsView.trailingAnchor.constraint(equalTo: bottomSeparator.trailingAnchor),
			healthNewsView.widthAnchor.constraint(equalTo: bottomSeparator.widthAnchor),
			healthNewsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
			
		])
	}

}
