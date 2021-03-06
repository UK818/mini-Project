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
		static let home_non_active = UIImage(named: "ic_home-29")
		static let lifestyle_non_active = UIImage(named: "ic_lifestyle-29")
		static let account_non_active = UIImage(named: "ic_account-29")
		
		static let home_active = UIImage(named: "ic_home_active-76")
		static let lifestyle_active = UIImage(named: "ic_lifestyle_active-76")
		static let account_active = UIImage(named: "ic_account_active-76")
		
		static let log_readings = UIImage(named: "ic_log_readings_tile-83.5")
		static let log_activity = UIImage(named: "ic_log_activity_tile-83.5")
		static let log_symptoms = UIImage(named: "ic_log_symptoms_tile-83.5")
		
		static let home_notification = UIImage(named: "ic_main_notifiaction-76")
		static let notification = UIImage(named: "ic_topbar_notification-40")
		
		static let back_button = UIImage(named: "ic_topbar_back-29")
		static let forward_button = UIImage(named: "ic_view_all_posts-21")
		
		static let like_button = UIImage(named: "icons8-filled-heart-29")
		static let unlike_button = UIImage(named: "ic_like-29")
		static let share_button = UIImage(named: "ic_share-29")
		
		static let health_readings = UIImage(named: "ic_enter_reading_manually-60")
		static let glucose_level_reading = UIImage(named: "ic_take_reading_with_dnurse-60")
		static let blood_pressure_reading = UIImage(named: "0c_take_reading_with_jumper-83.5")
		
		static let background = UIImage(named: "young-african-american-woman-blue-wall-coughing-lot_1368-96518 1")
		static let display_picture = UIImage(named: "post_profile_avatar-60")
	}
	
	enum LogTitles {
		static let log_readings = """
Log
Readings
"""
		static let log_activity = """
Log
Activity
"""
		static let log_symptoms = """
Log
Symptoms
"""
		static let health_readings = "Enter Reading Manually"
		static let glucose_level_reading = "Take reading with Dnurse"
		static let blood_pressure_reading = "Take reading with jumper"
	}
	
	enum LogDescriptions {
		static let health_readings = "Health Readings"
		static let glucose_level_reading = "Glucose Level Reading"
		static let blood_pressure_reading = "Blood Pressure Reading"
	}
	
	enum LogCollections {
		static let titleTexts = [LogTitles.health_readings, LogTitles.glucose_level_reading, LogTitles.blood_pressure_reading]
		static let descriptionTexts = [LogDescriptions.health_readings, LogDescriptions.glucose_level_reading, LogDescriptions.blood_pressure_reading]
		static let images = [Images.health_readings, Images.glucose_level_reading, Images.blood_pressure_reading]
	}
	
	enum Identifiers {
		static let notificationCell = "NotificationTableViewCell"
		static let healthNews = "HealthNewsCollectionViewCell"
		static let LogHealthReadings =  "LogTableViewCell"
	}
	
	enum Colors {
		static let ash1 = UIColor(named: "ash1")
		static let ash2 = UIColor(named: "ash2")
		static let purple_bg = UIColor(named: "purple_bg")
		static let purple = UIColor(named: "purple")
		static let active = UIColor(named: "active")
		static let lemon_green = UIColor(named: "lemon_green")
	}
	
}
