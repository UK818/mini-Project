//
//  HealthNewsViewLayout.swift
//  mini Project
//
//  Created by mac on 09/06/2022.
//

import Foundation
import UIKit

class HealthNewsViewLayout {
	
	let HealthNewsCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 20
		layout.minimumInteritemSpacing = 20
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = Constants.Colors.ash1
		collectionView.register(HealthNewsCollectionViewCell.self, forCellWithReuseIdentifier: HealthNewsCollectionViewCell.identifier)
		return collectionView
	}()
	
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
		configuration.titlePadding = 15
		configuration.imagePadding = 15
		configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25)
		
		let button = UIButton(configuration: configuration)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
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
		configuration.title = "Share"
		configuration.image = Constants.Images.share_button
		configuration.baseBackgroundColor = Constants.Colors.ash2
		configuration.baseForegroundColor = .black
		configuration.titlePadding = 15
		configuration.imagePadding = 15
		configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25)
		
		let button = UIButton(configuration: configuration)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	func concatenateAttrTexts(left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
		let result = NSMutableAttributedString()
		result.append(left)
		result.append(right)
		return result
	}
	
	func containerView(populateWith data: NewsModel) -> UIView {
		
		let text = data.newsDescription
		let extendedString = "Read More"
		let attribute = [ NSAttributedString.Key.foregroundColor: Constants.Colors.active ]
		let attrStringExtension = NSAttributedString(string: extendedString, attributes: attribute as [NSAttributedString.Key : Any])
		
		var textString = text.prefix(60)
		textString += "... "
		let attrDescriptionString = NSAttributedString(string: String(textString))
		
		let finalDescription = concatenateAttrTexts(left: attrDescriptionString, right: attrStringExtension)
		
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
			label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
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
			label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let newsDescription: UILabel = {
			let label = UILabel()
			label.attributedText = finalDescription
			label.numberOfLines = 2
			label.lineBreakMode = .byWordWrapping
			label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		container.addSubview(displayPicture)
		container.addSubview(nameLabel)
		container.addSubview(timeLabel)
		container.addSubview(newsImage)
		container.addSubview(textBox)
		
		textBox.addSubview(newsTitle)
		textBox.addSubview(newsDescription)
		
		NSLayoutConstraint.activate([
			displayPicture.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
			displayPicture.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
			displayPicture.widthAnchor.constraint(equalToConstant: 40),
			displayPicture.heightAnchor.constraint(equalToConstant: 40),
			
			nameLabel.topAnchor.constraint(equalTo: displayPicture.topAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: displayPicture.trailingAnchor, constant: 10),
			nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			nameLabel.heightAnchor.constraint(equalToConstant: 20),
			
			timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			timeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
			timeLabel.heightAnchor.constraint(equalToConstant: 20),
			
			newsImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
			newsImage.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			newsImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			newsImage.widthAnchor.constraint(equalTo: container.widthAnchor),
			newsImage.heightAnchor.constraint(equalToConstant: 160),
			
			textBox.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10),
			textBox.leadingAnchor.constraint(equalTo: newsImage.leadingAnchor),
			textBox.trailingAnchor.constraint(equalTo: newsImage.trailingAnchor),
			textBox.heightAnchor.constraint(equalToConstant: 100),
			textBox.widthAnchor.constraint(equalToConstant: container.frame.width),
			textBox.bottomAnchor.constraint(equalTo: container.bottomAnchor),
			
			newsTitle.topAnchor.constraint(equalTo: textBox.topAnchor),
			newsTitle.leadingAnchor.constraint(equalTo: textBox.leadingAnchor, constant: 17),
			newsTitle.trailingAnchor.constraint(equalTo: textBox.trailingAnchor, constant: -17),
			newsTitle.heightAnchor.constraint(equalToConstant: 49),
			
			newsDescription.topAnchor.constraint(equalTo: newsTitle.bottomAnchor),
			newsDescription.leadingAnchor.constraint(equalTo: newsTitle.leadingAnchor),
			newsDescription.trailingAnchor.constraint(equalTo: newsTitle.trailingAnchor),
			newsDescription.heightAnchor.constraint(equalToConstant: 36),
			newsDescription.bottomAnchor.constraint(equalTo: textBox.bottomAnchor, constant: -10)
		])
		
		if data.mainImage != Constants.Images.background {
			newsImage.isHidden = true
			textBox.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
		} else {
			newsImage.isHidden = false
			textBox.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10).isActive = true
		}
		
		return container
	}
	
}
