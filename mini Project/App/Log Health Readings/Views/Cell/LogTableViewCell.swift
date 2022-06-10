//
//  LogTableViewCell.swift
//  mini Project
//
//  Created by mac on 10/06/2022.
//

import UIKit

class LogTableViewCell: UITableViewCell {

	static let identifier = Constants.Identifiers.LogHealthReadings
	
	private var viewLayout: LogViewLayout!
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
		viewLayout = LogViewLayout()
	}
	
	private func setUpLayoutConstraints() {
		contentView.addSubview(container)
		contentView.backgroundColor = .white
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: contentView.topAnchor),
			container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			container.heightAnchor.constraint(equalToConstant: 80)
		])
	}
	
	public func populateCell(with data: LogCellModel) {
		container = viewLayout.containerView(populateWith: data)
		setUpLayoutConstraints()
	}
}
