//
//  CalendarManager.swift
//  MyTodo
//
//  Created by Piotr Brus on 02/03/2021.
//

import Foundation
import EventKit

class CalendarModel {
    func check_permission(start_date: Date, event_name: String) {
        let eventStore = EKEventStore()
        switch EKEventStore.authorizationStatus(for: .event) {
            case .authorized:
                insertEvent(store: eventStore, startDate: start_date, event_name: event_name)
                case .denied:
                    print("Access denied")
                case .notDetermined:
                    eventStore.requestAccess(to: .event) {(status, error) in
                        if status {
                            self.insertEvent(store: eventStore, startDate: start_date, event_name: event_name)
                        } else {
                            print(error?.localizedDescription)
                        }
                        
                    }
                    default:
                        print("Case default")
            }
    }
    
    func insertEvent(store: EKEventStore, startDate: Date, event_name: String) {
        let calendars = store.calendars(for: .event)
        for calendar in calendars {
            if calendar.title == "MyTodoCalendar" {
                //MARK: -To sobie można pozmieniać według własnych upodobań
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                event.startDate = startDate
                event.title = event_name
                event.endDate = event.startDate.addingTimeInterval(60)
                event.recurrenceRules = [EKRecurrenceRule(recurrenceWith: .daily, interval: 1, end: nil)]
                let reminder1 = EKAlarm(relativeOffset: -60)
                let reminder2 = EKAlarm(relativeOffset: -300)
                event.alarms = [reminder1, reminder2]
                do {
                    try store.save(event, span: .thisEvent)
                    print("Jest event!")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
