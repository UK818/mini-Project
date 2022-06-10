//
//  DisplayNewsViewController.swift
//  mini Project
//
//  Created by mac on 10/06/2022.
//

import UIKit

class DisplayNewsViewController: UIViewController {
	
	private var viewLayout: DisplayNewsViewLayout!
	
	private var notificationButton: UIBarButtonItem!
	private var container: UIView!
	private var buttonContainer: UIView!
	private var likeButton: UIButton!
	private var shareButton: UIButton!
	private var divider: UIView!
	
	init(viewLayout: DisplayNewsViewLayout) {
		super.init(nibName: nil, bundle: nil)
		self.viewLayout = viewLayout
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupVC()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		self.navigationItem.title = "Health News"
	}
	
	private func setupVC() {
		self.notificationButton = viewLayout.notificationButton
		self.buttonContainer = viewLayout.buttonContainer
		self.likeButton = viewLayout.likeButton
		self.shareButton = viewLayout.shareButton
		self.divider = viewLayout.divider
		
		self.notificationButton.target = self
		self.notificationButton.action = #selector(navigateToNotifications)
		
		self.view.backgroundColor = .white
		
		self.navigationItem.title = "Health News"
		self.navigationItem.rightBarButtonItem = notificationButton
		
		self.navigationController?.navigationBar.backIndicatorImage = Constants.Images.back_button
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Constants.Images.back_button
		self.navigationController?.navigationBar.topItem?.title = ""
		self.navigationController?.navigationBar.tintColor = .black
		
		self.likeButton.addTarget(self, action: #selector(toggleLikeButton), for: .touchUpInside)
	}
	
	private func setUpLayoutConstraints() {
		view.addSubview(container)
		view.addSubview(buttonContainer)
		
		self.buttonContainer.addSubview(likeButton)
		self.buttonContainer.addSubview(divider)
		self.buttonContainer.addSubview(shareButton)
		
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			container.widthAnchor.constraint(equalToConstant: view.frame.width),
			
			buttonContainer.topAnchor.constraint(equalTo: container.bottomAnchor),
			buttonContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 17),
			buttonContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -17),
			buttonContainer.heightAnchor.constraint(equalToConstant: 50),
			
			likeButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor),
			likeButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor),
			likeButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor, multiplier: 0.5, constant: -4),
			likeButton.heightAnchor.constraint(equalTo: buttonContainer.heightAnchor),
			likeButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor),
			
			divider.topAnchor.constraint(equalTo: buttonContainer.topAnchor, constant: 10),
			divider.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor),
			divider.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor, constant: -10),
			divider.heightAnchor.constraint(equalToConstant: buttonContainer.frame.height - 20),
			divider.widthAnchor.constraint(equalToConstant: 1),
			
			shareButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
			shareButton.leadingAnchor.constraint(equalTo: divider.trailingAnchor),
			shareButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor),
			shareButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor),
			shareButton.widthAnchor.constraint(equalToConstant: 100),
			shareButton.heightAnchor.constraint(equalTo: buttonContainer.heightAnchor)
		])
	}
	
	public func populateVC(with news: NewsModel) {
		self.container = viewLayout.containerView(populateWith: news)
		setUpLayoutConstraints()
		resizeContainer(news: news)
	}
	
	private func resizeContainer(news: NewsModel) {
		var height = 0.0
		if news.mainImage != Constants.Images.background {
			height = self.view.frame.height * 0.2
		} else {
			height = self.view.frame.height * 0.58
		}
		container.heightAnchor.constraint(equalToConstant: height).isActive = true
	}
	
	@objc func toggleLikeButton() {
		likeButton.setImage(likeButton.isSelected ? Constants.Images.unlike_button : Constants.Images.like_button, for: .normal)
	}
	
	@objc func navigateToNotifications() {
		let notificationViewLayout = NotificationViewLayout()
		let notificationVC = NotificationViewController(viewLayout: notificationViewLayout)
		navigationController?.pushViewController(notificationVC, animated: true)
	}

}
