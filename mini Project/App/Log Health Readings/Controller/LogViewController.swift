//
//  LogViewController.swift
//  mini Project
//
//  Created by mac on 10/06/2022.
//

import UIKit

class LogViewController: UIViewController {
	
	private var viewLayout: LogViewLayout!
	
	private var notificationButton: UIBarButtonItem!
	private var tableView: UITableView!
	
	init(viewLayout: LogViewLayout) {
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
    
	private func setupVC() {
		self.notificationButton = viewLayout.notificationButton
		self.tableView = viewLayout.tableView
		
		self.notificationButton.target = self
		self.notificationButton.action = #selector(navigateToNotifications)
		
		self.tableView.frame = view.bounds
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(LogTableViewCell.self, forCellReuseIdentifier: LogTableViewCell.identifier)
		
		self.view.addSubview(tableView)
		
		self.view.backgroundColor = .white
		
		self.navigationItem.title = "Log Health Readings"
		self.navigationItem.rightBarButtonItem = notificationButton
		
		self.navigationController?.navigationBar.isHidden = false
		self.navigationController?.navigationBar.backIndicatorImage = Constants.Images.back_button
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Constants.Images.back_button
		self.navigationController?.navigationBar.topItem?.title = ""
		self.navigationController?.navigationBar.tintColor = .black
	}

	@objc func navigateToNotifications() {
		let notificationViewLayout = NotificationViewLayout()
		let notificationVC = NotificationViewController(viewLayout: notificationViewLayout)
		navigationController?.pushViewController(notificationVC, animated: true)
	}
	
}

extension LogViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		Constants.LogCollections.titleTexts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: LogTableViewCell.identifier) as? LogTableViewCell else {
			return UITableViewCell()
		}
		let image = Constants.LogCollections.images[indexPath.row]
		let logTitle = Constants.LogCollections.titleTexts[indexPath.row]
		let logDescription = Constants.LogCollections.descriptionTexts[indexPath.row]
		
		let data = LogCellModel(image: image, title: logTitle, description: logDescription)
		cell.populateCell(with: data)
		
		return cell
	}
	
	
}

extension LogViewController: UITableViewDelegate {
	
}
