//
//  DisplayNewsViewLayout.swift
//  mini Project
//
//  Created by mac on 10/06/2022.
//

import Foundation
import UIKit

class DisplayNewsViewLayout {
	
	let notificationButton: UIBarButtonItem = {
		let button = UIBarButtonItem()
		button.image = Constants.Images.notification
		return button
	}()
	
	let buttonContainer: UIView = {
		let view = UIView()
		view.backgroundColor = Constants.Colors.ash2
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let likeButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Like"
		configuration.image = Constants.Images.unlike_button
		configuration.baseBackgroundColor = Constants.Colors.ash2
		configuration.baseForegroundColor = .black
		configuration.titlePadding = 10
		configuration.imagePadding = 10
		configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
		
		let button = UIButton(configuration: configuration)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let divider: UIView = {
		let view = UIView()
		view.backgroundColor = .gray
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let shareButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "share"
		configuration.image = Constants.Images.share_button
		configuration.baseBackgroundColor = Constants.Colors.ash2
		configuration.baseForegroundColor = .black
		configuration.titlePadding = 10
		configuration.imagePadding = 10
		configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
		
		let button = UIButton(configuration: configuration)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	func containerView(populateWith data: NewsModel) -> UIView {
		
		let container: UIView = {
			let view = UIView()
			view.backgroundColor = Constants.Colors.ash1
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let displayPicture: UIImageView = {
			let view = UIImageView()
			view.image = data.displayPicture
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let nameLabel: UILabel = {
			let label = UILabel()
			label.text = data.name
			label.textAlignment = .left
			label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let timeLabel: UILabel = {
			let label = UILabel()
			label.text = data.timePosted
			label.textAlignment = .left
			label.textColor = UIColor(white: 0.4, alpha: 1)
			label.font = UIFont.systemFont(ofSize: 13.5, weight: .regular)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let newsImage: UIImageView = {
			let view = UIImageView()
			view.image = data.mainImage
			view.contentMode = .scaleAspectFit
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let textBox: UIView = {
			let view = UIView()
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let newsTitle: UILabel = {
			let label = UILabel()
			label.text = data.newsTitle
			label.numberOfLines = 2
			label.lineBreakMode = .byWordWrapping
			label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let newsDescription: UILabel = {
			let label = UILabel()
			label.text = data.newsDescription
			label.numberOfLines = 0
			label.lineBreakMode = .byWordWrapping
			label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		container.addSubview(newsImage)
		container.addSubview(displayPicture)
		container.addSubview(nameLabel)
		container.addSubview(timeLabel)
		container.addSubview(textBox)
		
		textBox.addSubview(newsTitle)
		textBox.addSubview(newsDescription)
		
		NSLayoutConstraint.activate([
			newsImage.topAnchor.constraint(equalTo: container.topAnchor),
			newsImage.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			newsImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			newsImage.widthAnchor.constraint(equalTo: container.widthAnchor),
			newsImage.heightAnchor.constraint(equalToConstant: 240),
			
			displayPicture.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 17),
			displayPicture.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 17),
			displayPicture.widthAnchor.constraint(equalToConstant: 40),
			displayPicture.heightAnchor.constraint(equalToConstant: 40),
			
			nameLabel.topAnchor.constraint(equalTo: displayPicture.topAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: displayPicture.trailingAnchor, constant: 10),
			nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -17),
			nameLabel.heightAnchor.constraint(equalToConstant: 20),
			
			timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			timeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
			timeLabel.heightAnchor.constraint(equalToConstant: 20),
			
			textBox.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
			textBox.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
			textBox.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
//			textBox.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.4),
			textBox.widthAnchor.constraint(equalToConstant: container.frame.width),
			textBox.bottomAnchor.constraint(equalTo: container.bottomAnchor),
			
			newsTitle.topAnchor.constraint(equalTo: textBox.topAnchor),
			newsTitle.leadingAnchor.constraint(equalTo: textBox.leadingAnchor, constant: 10),
			newsTitle.trailingAnchor.constraint(equalTo: textBox.trailingAnchor, constant: -10),
			newsTitle.heightAnchor.constraint(equalToConstant: 49),
			
			newsDescription.topAnchor.constraint(equalTo: newsTitle.bottomAnchor),
			newsDescription.leadingAnchor.constraint(equalTo: newsTitle.leadingAnchor),
			newsDescription.trailingAnchor.constraint(equalTo: newsTitle.trailingAnchor),
			newsDescription.bottomAnchor.constraint(equalTo: textBox.bottomAnchor)
		])
		
		if data.mainImage != Constants.Images.background {
			newsImage.isHidden = true
			displayPicture.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
			textBox.topAnchor.constraint(equalTo: container.topAnchor, constant: 50).isActive = true
		} else {
			newsImage.isHidden = false
			displayPicture.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10).isActive = true
		}
		
		return container
	}
}
