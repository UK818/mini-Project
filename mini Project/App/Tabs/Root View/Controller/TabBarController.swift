//
//  ViewController.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import UIKit

class TabBarController: UITabBarController {

	let viewLayout = LifeStyleViewLayouts()
 
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpTabBar()
	}
	
	private func setUpTabBar() {
		viewControllers = [navigateToLifeStyleScreen(), navigateToHomeScreen(), navigateToAccountScreen()]
		self.tabBar.unselectedItemTintColor = UIColor.gray
		tabBar.tintColor = Constants.Colors.active
		tabBar.backgroundColor = .white
		tabBar.layer.borderColor = CGColor(gray: 0.1, alpha: 0.05)
		tabBar.layer.borderWidth = 2
	}

	private func navigateToHomeScreen() -> UINavigationController {
		let homeViewController = HomeViewController(viewLayout: viewLayout)
		homeViewController.tabBarItem.title = Constants.TabBarTitle.home
		homeViewController.tabBarItem.image = Constants.Images.home_non_active?.withRenderingMode(UIImage.RenderingMode.automatic)
		return UINavigationController(rootViewController: homeViewController)
	}

	private func navigateToLifeStyleScreen() -> UINavigationController {
		let lifestyleViewController = LifeStyleViewController(viewLayout: viewLayout)
		lifestyleViewController.tabBarItem.title = Constants.TabBarTitle.lifestyle
		lifestyleViewController.tabBarItem.image = Constants.Images.lifestyle_non_active?.withRenderingMode(UIImage.RenderingMode.automatic)
		return UINavigationController(rootViewController: lifestyleViewController)
	}

	private func navigateToAccountScreen() -> UINavigationController {
		let accountViewController = AccountViewController(viewLayout: viewLayout)
		accountViewController.tabBarItem.title = Constants.TabBarTitle.account
		accountViewController.tabBarItem.image = Constants.Images.account_non_active?.withRenderingMode(UIImage.RenderingMode.automatic)
		return UINavigationController(rootViewController: accountViewController)
	}

}

