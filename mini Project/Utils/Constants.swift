//
//  Constants.swift
//  mini Project
//
//  Created by mac on 07/06/2022.
//

import Foundation
import UIKit

class Constants {
	
	enum TabBarTitle {
		static let lifestyle = "Lifestyle"
		static let home = "Home"
		static let account = "Account"
	}
	
	enum Images {
		static let home_non_active = UIImage(named: "ic_home-60")
		static let lifestyle_non_active = UIImage(named: "ic_lifestyle-60")
		static let account_non_active = UIImage(named: "ic_account-76")
		
		static let home_active = UIImage(named: "ic_home_active-76")
		static let lifestyle_active = UIImage(named: "ic_lifestyle_active-76")
		static let account_active = UIImage(named: "ic_account_active-76")
		
		static let first_card_view = UIImage(named: "ic_log_readings_tile-76")
		static let second_card_view = UIImage(named: "ic_log_activity_tile-60")
		static let third_card_view = UIImage(named: "ic_log_symptoms_tile-60")
		
		static let home_notification = UIImage(named: "ic_main_notifiaction-76")
		static let notification = UIImage(named: "ic_topbar_notification-83.5")
		
		static let back_button = UIImage(named: "ic_topbar_back-76")
		static let forward_button = UIImage(named: "ic_view_all_posts-76")
		
		static let like_button = UIImage(named: "post_profile_avatar-60")
		static let unlike_button = UIImage(named: "ic_like-76")
		
		static let health_readings = UIImage(named: "ic_enter_reading_manually-60")
		static let glucose_level_reading = UIImage(named: "ic_take_reading_with_dnurse-60")
		static let blood_pressure_reading = UIImage(named: "0c_take_reading_with_jumper-83.5")
	}
	
	enum LogTitles {
		static let health_readings = "Enter Reading Manually"
		static let glucose_level_reading = "Take reading with Dnurse"
		static let blood_pressure_reading = "Take reading with jumper"
	}
	
	enum LogDescriptions {
		static let health_readings = "Health Readings"
		static let glucose_level_reading = "Glucose Level Reading"
		static let blood_pressure_reading = "Blood Pressure Reading"
	}
	
	enum Collections {
		static let logTitles = [Images.health_readings, Images.glucose_level_reading, Images.blood_pressure_reading]
		static let LogDescriptions = [LogDescriptions.health_readings, LogDescriptions.glucose_level_reading, LogDescriptions.blood_pressure_reading]
		
	}
	
	enum Identifier {
		static let explore = "ExploreCollectionViewCell"
		static let menu = "MenuCollectionViewCell"
		static let card =  "CardCollectionViewCell"
	}
	
	enum Colors {
		static let yellow = #colorLiteral(red: 1, green: 0.8248900771, blue: 0.2008669972, alpha: 1)
		static let deepBlue = #colorLiteral(red: 0, green: 0.002198057715, blue: 0.2281729579, alpha: 1)
	}
	
}
