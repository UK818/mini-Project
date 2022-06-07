//
//  ViewController.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import UIKit

class TabBarController: UITabBarController {

	let viewLayout = ViewLayouts()
 
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpTabBar()
	}
	
	private func setUpTabBar() {
		viewControllers = [navigateToLifeStyleScreen(), navigateToHomeScreen(), navigateToAccountScreen()]
		self.tabBar.unselectedItemTintColor = UIColor.gray
		tabBar.tintColor = .white
		tabBar.backgroundColor = UIColor(white: 0.3, alpha: 0.4)
	}

	private func navigateToHomeScreen() -> UINavigationController {
		let exploreViewController = HomeViewController(viewLayout: viewLayout)
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.home
		exploreViewController.tabBarItem.image = Constants.Images.home_non_active?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}

	private func navigateToLifeStyleScreen() -> UINavigationController {
		let exploreViewController = LifeStyleViewController(viewLayout: viewLayout)
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.lifestyle
		exploreViewController.tabBarItem.image = Constants.Images.lifestyle_non_active?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}

	private func navigateToAccountScreen() -> UINavigationController {
		let exploreViewController = AccountViewController(viewLayout: viewLayout)
		exploreViewController.tabBarItem.title = Constants.TabBarTitle.account
		exploreViewController.tabBarItem.image = Constants.Images.account_non_active?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
		return UINavigationController(rootViewController: exploreViewController)
	}

}

