//
//  HealthNewsViewController.swift
//  mini Project
//
//  Created by mac on 09/06/2022.
//

import UIKit

class HealthNewsViewController: UIViewController {
	
	private var viewLayout: HealthNewsViewLayout!
	private var collectionView: UICollectionView!
	private var notificationButton: UIBarButtonItem!
	
	public var healthNewsCollection: [NewsModel] = [NewsModel]()
	
	init(viewLayout: HealthNewsViewLayout) {
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
	
	override func viewDidAppear(_ animated: Bool) {
		self.navigationItem.title = "Health News"
	}

	private func setupVC() {
		self.collectionView = viewLayout.HealthNewsCollectionView
		self.notificationButton = viewLayout.notificationButton
		self.notificationButton.target = self
		self.notificationButton.action = #selector(navigateToNotifications)
		
		self.view.backgroundColor = .white
		self.view.addSubview(self.collectionView)
		
		self.navigationItem.title = "Health News"
		self.navigationItem.rightBarButtonItem = notificationButton
		
		self.navigationController?.navigationBar.backIndicatorImage = Constants.Images.back_button
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Constants.Images.back_button
		self.navigationController?.navigationBar.topItem?.title = ""
		self.navigationController?.navigationBar.tintColor = .black
		
		setupCollectionView()
		setupData()
		showNavigationBar()
	}
	
	private func setupCollectionView() {
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
		self.collectionView.frame = view.bounds
		self.collectionView.center = view.center
		self.collectionView.backgroundColor = .white
	}
	
	private func setupData() {
		let news1 = NewsModel(
			name: "Afya Pap",
			timePosted: "Posted 16 hours ago",
			displayPicture: Constants.Images.display_picture,
			mainImage: Constants.Images.background!,
			newsTitle: "How to manage cough symptoms, when you have covid?",
			newsDescription: """
   If you have a high temperature, it can help to:
   Get lots of rest
   Drink plenty of fluids (water is best) to avoid dehydration – drink enough so your pee is light yellow and clear
   Take paracetamol or ibuprofen if you feel uncomfortable
   """,
			isLiked: false)
		
		let news2 = NewsModel(
			name: "Afya Pap",
			timePosted: "Posted 16 hours ago",
			displayPicture: Constants.Images.display_picture,
			mainImage: UIImage(),
			newsTitle: "How else can I help stop the spread of the coronavirus?",
			newsDescription: "Use proper sneezing and coughing etiquette: Cover your mouth and nose...  Read More",
			isLiked: false)
		
		healthNewsCollection.append(news1)
		healthNewsCollection.append(news2)
	}
	
	private func showNavigationBar() {
		self.navigationController?.navigationBar.isHidden = false
	}
	
	@objc func navigateToNotifications() {
		let notificationViewLayout = NotificationViewLayout()
		let notificationVC = NotificationViewController(viewLayout: notificationViewLayout)
		navigationController?.pushViewController(notificationVC, animated: true)
	}
}

extension HealthNewsViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		healthNewsCollection.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HealthNewsCollectionViewCell.identifier, for: indexPath) as? HealthNewsCollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.populateCell(with: healthNewsCollection[indexPath.row], index: indexPath.row)
		return cell
	}
	
}

extension HealthNewsViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let viewLayout = DisplayNewsViewLayout()
		let displayVC = DisplayNewsViewController(viewLayout: viewLayout)
		displayVC.populateVC(with: healthNewsCollection[indexPath.row])
		navigationController?.pushViewController(displayVC, animated: true)
	}
	
}

extension HealthNewsViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		var height = 0.0
		let width = self.collectionView.frame.width - 34
		
		if healthNewsCollection[indexPath.row].mainImage != Constants.Images.background {
			height = self.collectionView.frame.height * 0.27
		} else {
			height = self.collectionView.frame.height * 0.52
		}
		
		return CGSize(width: width , height: height)
	}
	
}
