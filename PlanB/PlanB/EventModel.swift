//
//  EventModel.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import Foundation

enum EventType {

    case outDoor, movie, food, shopping, exercise

}

struct EventModel {

    var eventTitle: String
    var eventType: EventType
    var description: String
    var eventDate: String
    var eventPlace: String
    var eventLatitude: Double
    var eventLongitude: Double
    var tags: String
    var user_id: String

    init(eventTitle: String, eventType: EventType, description: String, eventDate: String,
         eventPlace: String, eventLatitude: Double, eventLongitude: Double, tags: String,
         user_id: String) {

        self.eventTitle = eventTitle
        self.eventType = eventType
        self.description = description
        self.eventDate = eventDate
        self.eventPlace = eventPlace
        self.eventLatitude = eventLatitude
        self.eventLongitude = eventLongitude
        self.tags = tags
        self.user_id = user_id
    }

}
