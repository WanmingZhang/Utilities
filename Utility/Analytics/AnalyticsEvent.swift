//
//  Event.swift
//  novo
//
//  Created by Zhang, Wanming on 2/25/22.
//

import Foundation

protocol AnalyticsEventProtocol {
    var name: String { get set }
    var params: [String: Any] { get set }
}

@propertyWrapper
struct AnalyticsEvent: AnalyticsEventProtocol {
    var name: String
    var params: [String: Any] = [:]

    var wrappedValue: AnalyticsEvent {
        get  {
            return AnalyticsEvent(name: name, params: params)
        }
    }
}

