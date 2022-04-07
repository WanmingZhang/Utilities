//
//  NovoAnalyticsEvent.swift
//  novo
//
//  Created by Zhang, Wanming on 2/28/22.
//

import Foundation

enum AnalyticsEvents {
    
    //Safety
    enum Safety {
        static let parkingSafetyCardTapped = { (numberOfCases: Int) in
            AnalyticsEvent(parkingSafetyCardTapped: numberOfCases)
        }
        
        static let trafficSafetyCardTapped = { (numberOfCases: Int) in
            AnalyticsEvent(trafficSafetyCardTapped: numberOfCases)
        }
    }

    //Login
    enum Login {
        @AnalyticsEvent(name: "SignInSuccess") //signed in successfully
        static var signInSuccess: AnalyticsEvent
        
        @AnalyticsEvent(name: "SignInFailed")
        static var signInFailed: AnalyticsEvent
        
        @AnalyticsEvent(name: "SignUpSuccess") //created password successfully
        static var signUpSuccess: AnalyticsEvent
        
        @AnalyticsEvent(name: "SignUpFailed")
        static var signUpFailed: AnalyticsEvent
        
        static let appOpened = { (loggedIn: Bool) in
            AnalyticsEvent(appOpened: loggedIn)
        }

        @AnalyticsEvent(name: "ConnectAccountTapped")
        static var connectAccountTapped: AnalyticsEvent

        @AnalyticsEvent(name: "QuoteButtonTapped")
        static var quoteButtonTapped: AnalyticsEvent
    }
}

// convenience initializer for events with parameters
extension AnalyticsEvent {
    // App opened
    init(appOpened loggedIn: Bool) {
        let dict = ["loggedIn" : loggedIn,
                    "isSimulator" : AppBuild.isSimulator,
                    "isTestFlight" : AppBuild.isTestFlight,
                    "hasEmbeddedMobileProvision" : AppBuild.hasEmbeddedMobileProvision]
        self.init(name: "AppOpened",
                  params: dict)
    }

    // Marketing content card tapped
    init(marketingCardTappedWith contentId: String) {
        let dict = ["contentId" : contentId]
        self.init(name: "MarketingContentCardTapped",
                  params: dict)
    }
    
    //safety
    init(parkingSafetyCardTapped numberOfCases: Int) {
        let dict = ["numberOfCases" : numberOfCases]
        self.init(name: "ParkingSafetyCardTapped",
                  params: dict)
    }
    
    init(trafficSafetyCardTapped numberOfCases: Int) {
        let dict = ["numberOfCases" : numberOfCases]
        self.init(name: "TrafficSafetyCardTapped",
                  params: dict)
    }
}
