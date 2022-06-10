//
//  LifeStyleViewController.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import UIKit

class LifeStyleViewController: UIViewController {
	
	private var viewLayout: LifeStyleViewLayouts!
	
	private var greetingLabel: UILabel!
	private var introMessageLabel: UILabel!
	private var notificationButton: UIButton!
	private var topSeparator: UIView!
	private var logReadingsView: UIView!
	private var logActivityView: UIView!
	private var logSymptomsView: UIView!
	private var bottomSeparator: UIView!
	private var healthNewsView: UIView!
	private var buttonContainer: UIView!
	private var viewAllButton: UIButton!
	
	init(viewLayout: LifeStyleViewLayouts) {
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
	
	override func viewWillAppear(_ animated: Bool) {
		hideNavigationBar()
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
		buttonContainer = viewLayout.buttonContainer
		viewAllButton = viewLayout.viewAllButton
		
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
		view.addSubview(buttonContainer)
		buttonContainer.addSubview(viewAllButton)
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToLogVC))
			view.addGestureRecognizer(tap)
		
		notificationButton.addTarget(self, action: #selector(navigateToNotifications), for: .touchUpInside)
		viewAllButton.addTarget(self, action: #selector(navigateToHealthNews), for: .touchUpInside)
	}
	
	@objc func navigateToNotifications() {
		let notificationViewLayout = NotificationViewLayout()
		let notificationVC = NotificationViewController(viewLayout: notificationViewLayout)
		navigationController?.pushViewController(notificationVC, animated: true)
	}
	
	@objc func navigateToHealthNews() {
		let viewLayout = HealthNewsViewLayout()
		let HealthNewsVC = HealthNewsViewController(viewLayout: viewLayout)
		navigationController?.pushViewController(HealthNewsVC, animated: true)
	}
	
	@objc func navigateToLogVC() {
		let viewLayout = LogViewLayout()
		let logVC = LogViewController(viewLayout: viewLayout)
		navigationController?.pushViewController(logVC, animated: true)
	}
	
	private func hideNavigationBar() {
		self.navigationController?.navigationBar.isHidden = true
	}

}

extension LifeStyleViewController {
	
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
			healthNewsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
			
			buttonContainer.topAnchor.constraint(equalTo: healthNewsView.bottomAnchor),
			buttonContainer.leadingAnchor.constraint(equalTo: healthNewsView.leadingAnchor),
			buttonContainer.trailingAnchor.constraint(equalTo: healthNewsView.trailingAnchor),
			buttonContainer.heightAnchor.constraint(equalToConstant: 40),
			
			viewAllButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor, constant: 10),
			viewAllButton.leadingAnchor.constraint(equalTo: healthNewsView.leadingAnchor, constant: 10),
			viewAllButton.widthAnchor.constraint(equalToConstant: 110),
			viewAllButton.heightAnchor.constraint(equalToConstant: 20),
			viewAllButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor, constant: -10)
			
		])
	}
	
}
