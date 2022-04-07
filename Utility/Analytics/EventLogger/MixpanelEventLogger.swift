//
//  MixpanelEventLogger.swift
//  novo
//
//  Created by Zhang, Wanming on 2/28/22.
//

import Foundation
import Mixpanel

class MixpanelEventLogger: AnalyticsEventsLoggerProtocol {
    
    static let kProdToken: [Character] = ["1", "6", "3", "d", "9", "3", "4", "9", "a", "a", "2", "d", "0", "a", "a", "2", "9", "7", "d", "3", "9", "2", "3", "a", "2", "4", "1", "c", "9", "1", "b", "4"] // token for Novo project
    static let kTestToken: [Character] = ["3", "7", "3", "c", "f", "0", "9", "8", "a", "3", "2", "5", "8", "7", "6", "5", "4", "2", "0", "9", "6", "8", "1", "4", "8", "d", "9", "3", "1", "c", "b", "2"] // token for Novo test project
    
    static func configure() {
        switch AppBuild.appBuildConfiguration {
        case .Debug:
            Mixpanel.initialize(token: String(kTestToken))
        case .TestFlight:
            Mixpanel.initialize(token: String(kTestToken))
        case .AppStore:
            Mixpanel.initialize(token: String(kProdToken))
        }
    }

    func trackEvent(event: AnalyticsEventProtocol) {
        // implementation of events tracking on Mixpanel 
        let params = event.params
        var mixpanelParams: [String: MixpanelType] = Dictionary()
        for (key, value) in params {
            if let mixpanelValue = value as? MixpanelType {
                mixpanelParams[key] = mixpanelValue
            }
        }
        Mixpanel.mainInstance().track(event: event.name, properties: mixpanelParams)
    }
}
