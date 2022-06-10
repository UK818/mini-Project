//
//  NotificationViewLayout.swift
//  mini Project
//
//  Created by mac on 09/06/2022.
//

import Foundation
import UIKit

class NotificationViewLayout {
	
	let notificationButton: UIBarButtonItem = {
		let button = UIBarButtonItem()
		button.image = Constants.Images.notification
		return button
	}()
	
	let backButton: UIBarButtonItem = {
		let button = UIBarButtonItem()
		button.tintColor = .black
		button.title = ""
		button.image = Constants.Images.back_button
		return button
	}()
	
	let tableView: UITableView = {
		let view = UITableView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	func notificationContainer(populateWith data: Notification) -> UIView {
		
		let container: UIView = {
			let view = UIView()
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let titleLabel: UILabel = {
			let label = UILabel()
			label.text = data.title
			label.textAlignment = .left
			label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let descriptionLabel: UILabel = {
			let label = UILabel()
			label.numberOfLines = 2
			label.textAlignment = .left
			label.text = data.description
			label.textColor = UIColor(white: 0.4, alpha: 1)
			label.font = UIFont.systemFont(ofSize: 13.5, weight: .regular)
			label.lineBreakMode = .byWordWrapping
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let timeLabel: UILabel = {
			let label = UILabel()
			label.text = data.time
			label.textAlignment = .right
			label.textColor = Constants.Colors.lemon_green
			label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		container.addSubview(titleLabel)
		container.addSubview(descriptionLabel)
		container.addSubview(timeLabel)
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
			titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			titleLabel.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7),
			titleLabel.heightAnchor.constraint(equalToConstant: 25),
			
			timeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
			timeLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			timeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			timeLabel.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.3),
			timeLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
			
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			descriptionLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
			descriptionLabel.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -20),
			descriptionLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 1.6),
			descriptionLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
			
		])
		
		return container
	}
	
}
