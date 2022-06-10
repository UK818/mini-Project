//
//  NotificationTableViewCell.swift
//  mini Project
//
//  Created by mac on 09/06/2022.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
	
	static let identidfier = Constants.Identifiers.notificationCell
	
	private var viewLayout: NotificationViewLayout!
	private var container: UIView!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .systemTeal
		cellConfig()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func cellConfig() {
		viewLayout = NotificationViewLayout()
	}
	
	private func setUpLayoutConstraints() {
		contentView.addSubview(container)
		contentView.backgroundColor = .white
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: contentView.topAnchor),
			container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
	
	public func populateCell(with data: Notification) {
		container = viewLayout.notificationContainer(populateWith: data)
		
		setUpLayoutConstraints()
	}

}
