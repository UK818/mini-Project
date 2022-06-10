//
//  NotificationTableViewController.swift
//  mini Project
//
//  Created by mac on 09/06/2022.
//

import UIKit

class NotificationViewController: UIViewController {
	
	private var notifications: [Notification] = [Notification]()
	private var viewLayout: NotificationViewLayout!
	private var notificationButton: UIBarButtonItem!
	private var tableView: UITableView!
	
	init(viewLayout: NotificationViewLayout) {
		super.init(nibName: nil, bundle: nil)
		self.viewLayout = viewLayout
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupData()
		setupVC()
		showNavigationBar()
    }
	
	private func showNavigationBar() {
		self.navigationController?.navigationBar.isHidden = false
	}
	
	private func setupData() {
		let title = "Take a reading reminder"
		let description = "It’s been 16 hours since you last checked your blood sugar"
		let time = "02:30PM"
		let notification = Notification(title: title, description: description, time: time)
		notifications.append(notification)
	}
	
	private func setupVC() {
		self.view.backgroundColor = .white
		self.notificationButton = viewLayout.notificationButton
		self.tableView = viewLayout.tableView
		
		self.navigationItem.title = "Notifications"
		self.navigationItem.rightBarButtonItem = notificationButton
		
		self.navigationController?.navigationBar.backIndicatorImage = Constants.Images.back_button
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Constants.Images.back_button
		self.navigationController?.navigationBar.topItem?.title = ""
		self.navigationController?.navigationBar.tintColor = .black
		
		self.tableView.frame = view.bounds
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.identidfier)
		
		self.view.addSubview(tableView)
		
	}

}

extension NotificationViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	   guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identidfier)! as? NotificationTableViewCell else {
		   return UITableViewCell()
	   }
	   cell.populateCell(with: notifications[indexPath.row])
	   return cell
    }

}

extension NotificationViewController: UITableViewDelegate {
	
	
	
}
