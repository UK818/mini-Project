//
//  LogViewLayout.swift
//  mini Project
//
//  Created by mac on 10/06/2022.
//

import Foundation
import UIKit

class LogViewLayout {
	
	let notificationButton: UIBarButtonItem = {
		let button = UIBarButtonItem()
		button.image = Constants.Images.notification
		return button
	}()
	
	let tableView: UITableView = {
		let view = UITableView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	func containerView(populateWith data: LogCellModel) -> UIView {
		let container: UIView = {
			let view = UIView()
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let imageView: UIImageView = {
			let view = UIImageView()
			view.image = data.image
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		let titleLabel: UILabel = {
			let label = UILabel()
			label.textAlignment = .left
			label.text = data.title
			label.textColor = .black
			label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		let descriptionLabel: UILabel = {
			let label = UILabel()
			label.textAlignment = .left
			label.text = data.description
			label.textColor = .gray
			label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
			label.translatesAutoresizingMaskIntoConstraints = false
			return label
		}()
		
		container.addSubview(imageView)
		container.addSubview(titleLabel)
		container.addSubview(descriptionLabel)
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
			imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
			imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
			imageView.widthAnchor.constraint(equalToConstant: 60),
			imageView.heightAnchor.constraint(equalToConstant: 60),
			
			titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
			titleLabel.heightAnchor.constraint(equalToConstant: 22),
			
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			descriptionLabel.heightAnchor.constraint(equalToConstant: 18),
			descriptionLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10)
		])
		
		return container
	}
	
}
