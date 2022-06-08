//
//  HomeViewController.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
	
	private var viewLayout: ViewLayouts!
	
	init(viewLayout: ViewLayouts) {
		self.viewLayout = viewLayout
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
