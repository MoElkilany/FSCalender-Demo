//
//  MainViewVC.swift
//  FSCalender-Demo
//
//  Created by Mohamed Elkilany on 29/09/2021.
//

import UIKit
import FSCalendar_Persian

class MainViewVC: UIViewController {
    
    @IBOutlet weak var calender: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    var eventsDateArray: [String] = ["24/02/1443","01/03/1443","01/04/1443","08/05/1443","12/05/1443","10/05/1443"]
    let hijriCalendar = Calendar(identifier: .islamicUmmAlQura)
   override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainViewCell.nib(), forCellReuseIdentifier: MainViewCell.cellID)
        tableView.separatorStyle = .none
    calender.calendarIdentifier = NSCalendar.Identifier.islamicUmmAlQura.rawValue
        calender.delegate = self
        calender.dataSource = self
        calender.locale = Locale(identifier: "ar_SA")
        calender.appearance.calendar.locale =  Locale(identifier: "ar_SA")
        calender.appearance.borderRadius = 12
        calender.appearance.headerMinimumDissolvedAlpha = 0.0
        calender.calendarWeekdayView.layer.cornerRadius = 12
        calender.calendarHeaderView.layer.cornerRadius = 12
    }
}


extension MainViewVC : FSCalendarDelegate ,FSCalendarDelegateAppearance ,FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let hijriCalendar = Calendar(identifier: .islamicCivil)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_SA")
        formatter.calendar = hijriCalendar
        formatter.dateFormat = "dd/MM/yyyy"
        print(formatter.string(from: date))
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        var fullDate : [Date] = []
        let hijriCalendar = Calendar(identifier: .islamicCivil)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = hijriCalendar
        dateFormatter.locale = Locale(identifier: "ar_SA")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        for dateString in eventsDateArray {
            fullDate.append(dateFormatter.date(from:dateString)!)
        }
        if fullDate.contains(date){
            return .white
        }
        return .black
    }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        var fullDate : [Date] = []
        let hijriCalendar = Calendar(identifier: .islamicCivil)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_SA") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.calendar = hijriCalendar
        for dateString in eventsDateArray {
            fullDate.append(dateFormatter.date(from:dateString)!)
        }
        if fullDate.contains(date){
            return .systemPink
        }
        return .white
    }
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_SA")
        dateFormatter.dateFormat = "d"
        dateFormatter.calendar = hijriCalendar
        return dateFormatter.string(from: date - 1 )
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_SA")
        dateFormatter.dateFormat = "d"
        dateFormatter.calendar = hijriCalendar
    }

}




extension MainViewVC :UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.cellID, for: indexPath) as! MainViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  250
    }
}
