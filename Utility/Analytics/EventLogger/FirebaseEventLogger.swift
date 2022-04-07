//
//  FirebaseEventLogger.swift
//  novo
//
//  Created by Zhang, Wanming on 2/28/22.
//

import Foundation
import FirebaseAnalytics

class FirebaseEventLogger: AnalyticsEventsLoggerProtocol {

    static func configure() {
      //
    }
    
    func trackEvent(event: AnalyticsEventProtocol) {
        // implementation of events tracking on Firebase 
        Analytics.logEvent(event.name, parameters: event.params)
    }
}
