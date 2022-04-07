//
//  AnalyticsManager.swift
//  novo
//
//  Created by Zhang, Wanming on 2/25/22.
//

import Foundation

protocol AnalyticsManagerProtocol {
    func setUp()
    func trackEvent(_ event: AnalyticsEventProtocol,
                    params: [String: Any])
}

class AnalyticsManager: AnalyticsManagerProtocol {
    static let shared = AnalyticsManager()
    private init() {
        setUp()
    }
    
    var loggers: [AnalyticsEventsLoggerProtocol] = []
    func setUp() {
        // Setup all the Analytics SDK
        loggers = [FirebaseEventLogger(), MixpanelEventLogger()]
    }
    
    func trackEvent(_ event: AnalyticsEventProtocol,
                    params: [String: Any] = [:]) { // add extra params to event
        
        // track event from all tracking SDK's
        loggers.forEach({ logger in
            logger.trackEvent(event: event)
        })
    }
}
