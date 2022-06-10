//
//  HomeViewController.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
	
	private var viewLayout: LifeStyleViewLayouts!
	
	let label: UILabel = {
		let label = UILabel()
		label.text = "Home Under construction"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	init(viewLayout: LifeStyleViewLayouts) {
		self.viewLayout = viewLayout
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .white
		view.addSubview(label)
		label.center = view.center
		label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}
