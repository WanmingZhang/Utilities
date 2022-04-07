//
//  EventLogger.swift
//  novo
//
//  Created by Zhang, Wanming on 2/25/22.
//

import Foundation

protocol AnalyticsEventsLoggerProtocol {
    static func configure()
    func trackEvent(event: AnalyticsEventProtocol)
}




