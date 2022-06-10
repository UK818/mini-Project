//
//  HealthNewsCollectionViewCell.swift
//  mini Project
//
//  Created by mac on 09/06/2022.
//

import UIKit

class HealthNewsCollectionViewCell: UICollectionViewCell {
    
	static let identifier = Constants.Identifiers.healthNews
	
	private var viewLayout: HealthNewsViewLayout!
	private var container: UIView!
	private var buttonContainer: UIView!
	public var likeButton: UIButton!
	private var shareButton: UIButton!
	private var divider: UIView!
	
	private var index = 0
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		cellConfig()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func cellConfig() {
		self.viewLayout = HealthNewsViewLayout()
		self.buttonContainer = viewLayout.buttonContainer
		self.likeButton = viewLayout.likeButton
		self.shareButton = viewLayout.shareButton
		self.divider = viewLayout.divider
		
		self.buttonContainer.addSubview(likeButton)
		self.buttonContainer.addSubview(divider)
		self.buttonContainer.addSubview(shareButton)
		
		contentView.backgroundColor = Constants.Colors.ash1
		contentView.layer.borderWidth = 0.151
		contentView.layer.cornerRadius = 5
		
		self.likeButton.addTarget(self, action: #selector(toggleLikeButton), for: .touchUpInside)
	}
	
	private func setupLayoutConstraints() {
		contentView.addSubview(container)
		contentView.addSubview(buttonContainer)
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: contentView.topAnchor),
			container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			container.widthAnchor.constraint(equalToConstant: contentView.frame.width),
			
			buttonContainer.topAnchor.constraint(equalTo: container.bottomAnchor),
			buttonContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			buttonContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			buttonContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
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
	
	public func populateCell(with news: NewsModel, index: Int){
		container = viewLayout?.containerView(populateWith: news)
		setupLayoutConstraints()
		self.index = index
	}
	
	@objc func toggleLikeButton() {
		print(index)
	
		let healthNewsVC = HealthNewsViewController(viewLayout: HealthNewsViewLayout())
		print(healthNewsVC.healthNewsCollection.count)
		if healthNewsVC.healthNewsCollection[self.index].isLiked == true {
			likeButton.setImage(Constants.Images.unlike_button, for: .normal)
			healthNewsVC.healthNewsCollection[self.index].isLiked = false
		} else {
			likeButton.setImage(Constants.Images.like_button, for: .normal)
			healthNewsVC.healthNewsCollection[self.index].isLiked = true
		}
	}
}
