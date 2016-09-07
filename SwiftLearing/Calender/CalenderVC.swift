//
//  CalenderVC.swift
//  SwiftLearing
//
//  Created by Bala on 07/09/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import EPCalendarPicker

class CalenderVC: UIViewController, EPCalendarPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let calendarPicker = EPCalendarPicker(startYear: 2016, endYear: 2017, multiSelection: true, selectedDates: [])
        calendarPicker.calendarDelegate = self
        calendarPicker.startDate = NSDate()
        calendarPicker.hightlightsToday = true
        calendarPicker.showsTodaysButton = true
        calendarPicker.hideDaysFromOtherMonth = true
        calendarPicker.tintColor = UIColor.orangeColor()
        //        calendarPicker.barTintColor = UIColor.greenColor()
        calendarPicker.dayDisabledTintColor = UIColor.grayColor()
        calendarPicker.title = "Date Picker"
        
        //        calendarPicker.backgroundImage = UIImage(named: "background_image")
        //        calendarPicker.backgroundColor = UIColor.blueColor()
        
        let navigationController = UINavigationController(rootViewController: calendarPicker)
        self.presentViewController(navigationController, animated: true, completion: nil)       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func epCalendarPicker(_: EPCalendarPicker, didCancel error : NSError) {
//        txtViewDetail.text = "User cancelled selection"
        
    }
    func epCalendarPicker(_: EPCalendarPicker, didSelectDate date : NSDate) {
//        txtViewDetail.text = "User selected date: \n\(date)"
        
    }
    func epCalendarPicker(_: EPCalendarPicker, didSelectMultipleDate dates : [NSDate]) {
//        txtViewDetail.text = "User selected dates: \n\(dates)"
    }
    

   
}
