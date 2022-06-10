//
//  ViewLayouts.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import Foundation
import UIKit

class LifeStyleViewLayouts {
	let greetingLabel: UILabel = {
		let label = UILabel()
		label.text = "Good Morning, Tinashe"
		label.textAlignment = .left
		label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let introMessageLabel : UILabel = {
		let label = UILabel()
		label.text = """
Its been 16 hours since you last
checked your blood sugar
"""
		label.numberOfLines = 2
		label.textAlignment = .left
		label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
		label.lineBreakMode = .byWordWrapping
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let notificationButton: UIButton = {
		let button = UIButton()
		button.setImage(Constants.Images.home_notification, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let stackContainer: UIStackView = {
		let view = UIStackView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.axis = .horizontal
		view.distribution = .fillEqually
		return view
	}()
	
	let buttonContainer: UIView = {
		let view = UIView()
		view.backgroundColor = Constants.Colors.purple_bg
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let viewAllButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = Constants.Colors.purple_bg
		button.setTitle("View all posts ", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
		button.setTitleColor(Constants.Colors.purple, for: .normal)
		button.contentMode = .scaleAspectFill
		button.setImage(Constants.Images.forward_button, for: .normal)
		button.semanticContentAttribute = UIApplication.shared
			.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
		
	func cardView(image: UIImage, title: String) -> UIView {
		let container: UIView = {
			let view = UIView()
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let imageView: UIImageView = {
			let view = UIImageView()
			view.contentMode = .scaleAspectFit
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let titleLabel: UILabel = {
			let label = UILabel()
			label.textAlignment = .left
			label.numberOfLines = 2
			label.lineBreakMode = .byWordWrapping
			label.textColor = Constants.Colors.lemon_green
			label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		imageView.image = image
		titleLabel.text = title
		
		container.addSubview(imageView)
		container.addSubview(titleLabel)
		
		imageView.frame = container.bounds
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: container.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
			imageView.widthAnchor.constraint(equalTo: container.widthAnchor),
			imageView.heightAnchor.constraint(equalTo: container.heightAnchor),
			
			titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
			titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10)
		])
		
		return container
	}
	
	func separatorView() -> UIView {
		let separator: UIView = {
			let view = UIView()
			view.backgroundColor = Constants.Colors.ash2
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		return separator
	}
	
	func healthNewsView() -> UIView {
		let mainContainer: UIView = {
			let view = UIView()
			view.backgroundColor = Constants.Colors.purple_bg
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let mainLabel: UILabel = {
			let label = UILabel()
			label.text = "Health News"
			label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let container: UIView = {
			let view = UIView()
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let imageView: UIImageView = {
			let view = UIImageView()
			view.image = Constants.Images.background
			view.contentMode = .scaleToFill
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let textBox: UIView = {
			let view = UIView()
			view.backgroundColor = UIColor(white: 1, alpha: 0.9)
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let titleLabel: UILabel = {
			let label = UILabel()
			label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
			label.text = "How to manage cough symp- toms, when you have covid?"
			label.numberOfLines = 2
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let timePostedLabel: UILabel = {
			let label = UILabel()
			label.textColor = UIColor(white: 0.4, alpha: 1)
			label.text = "Posted 16 hours ago"
			label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		mainContainer.addSubview(mainLabel)
		mainContainer.addSubview(container)
		
		container.addSubview(imageView)
		container.addSubview(textBox)
		
		textBox.addSubview(titleLabel)
		textBox.addSubview(timePostedLabel)
		
		NSLayoutConstraint.activate([
			mainLabel.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 10),
			mainLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 10),
			mainLabel.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -10),
			mainLabel.widthAnchor.constraint(equalTo: mainContainer.widthAnchor, constant: -20),
			mainLabel.heightAnchor.constraint(equalToConstant: 20),
			
			container.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
			container.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
			container.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor),
			container.widthAnchor.constraint(equalTo: mainLabel.widthAnchor),
			container.heightAnchor.constraint(equalTo: mainContainer.heightAnchor, multiplier: 0.82),
			container.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
			
			imageView.topAnchor.constraint(equalTo: container.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
			imageView.heightAnchor.constraint(equalTo: container.heightAnchor),
			imageView.widthAnchor.constraint(equalTo: container.widthAnchor),
			
			textBox.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			textBox.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			textBox.bottomAnchor.constraint(equalTo: container.bottomAnchor),
			textBox.heightAnchor.constraint(equalToConstant: 70),
			textBox.widthAnchor.constraint(equalTo: container.widthAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: textBox.topAnchor, constant: 5),
			titleLabel.leadingAnchor.constraint(equalTo: textBox.leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: textBox.trailingAnchor, constant: -10),
			titleLabel.heightAnchor.constraint(equalTo: textBox.heightAnchor, multiplier: 0.65),
			titleLabel.widthAnchor.constraint(equalTo: textBox.widthAnchor, constant: -10),
			
			timePostedLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			timePostedLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			timePostedLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			timePostedLabel.bottomAnchor.constraint(equalTo: textBox.bottomAnchor),
			timePostedLabel.heightAnchor.constraint(equalTo: textBox.heightAnchor, multiplier: 0.35),
			timePostedLabel.widthAnchor.constraint(equalTo: textBox.widthAnchor, constant: -10)
		])
		
		return mainContainer
	}

}
