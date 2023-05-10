//
//  CustomSchedulePage.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-05-09.
//

//import Foundation
//import UIKit
//import CalendarKit
//import EventKit
//
//class CustomSchedulePage : DayViewController {
//
//    private let eventStore = EKEventStore()
//    override func viewDidLoad() {
//        view.backgroundColor = .red
//        title = "Custom Schedule Page"
//        requestAccessToCalender()
//    }
//
//    func requestAccessToCalender() {
//        eventStore.requestAccess(to: .event) { success, error in
//
//        }
//    }
//    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
//        let startDate = date
//        var oneDayComponents = DateComponents()
//        oneDayComponents.day = 1
//
//        let endDate = calendar.date(byAdding: oneDayComponents, to: startDate)
//
//        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
//
//        let eventKitEvents = eventStore.events(matching: predicate)
//
//        let calenderKitEvents = eventKitEvents.map { ekEvent in
//            let ckEvent = Event()
//            ckEvent.startDate = ekEvent.startDate
//            ckEvent.endDate = ekEvent.endDate
//            ckEvent.isAllDay = ekEvent.isAllDay
//            ckEvent.text = ekEvent.title
//            if let eventColor = ekEvent.calender.cgColor{
//                ckEvent.color = UIColor(cgColor: eventColor)
//            }
//            return ckEvent
//        }
//
//    }
//}
import Foundation
import UIKit
import CalendarKit
import EventKit

class CustomSchedulePage: DayViewController {
    
    private let eventStore = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Custom Schedule Page"
        requestAccessToCalendar()
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: .event) { success, error in
            
        }
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        let startDate = date
        var oneDayComponents = DateComponents()
        oneDayComponents.day = 1
        
        let endDate = Calendar.current.date(byAdding: oneDayComponents, to: startDate)!
        
        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
        
        let eventKitEvents = eventStore.events(matching: predicate)
        
        let calendarKitEvents = eventKitEvents.map { ekEvent in
            let ckEvent = Event()
            ckEvent.startDate = ekEvent.startDate
            ckEvent.endDate = ekEvent.endDate
            ckEvent.isAllDay = ekEvent.isAllDay
            ckEvent.text = ekEvent.title
            if let eventColor = ekEvent.calendar.cgColor {
                ckEvent.color = UIColor(cgColor: eventColor)
            }
            return ckEvent
        }
        
        return calendarKitEvents
    }
}

