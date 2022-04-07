//
//  ViewModel.swift
//  Utility
//
//  Created by Zhang, Wanming on 4/6/22.
//

import Foundation

protocol ViewModelProtocol {
    func fetchFromCloud() // parameters
    func setError(_ message: String)
    
    var fetchedResults: Observable<[Result]> { get  set } //1
    var errorMessage: Observable<String?> { get set }
    var error: Observable<Bool> { get set }
}

class ViewModel: ViewModelProtocol {
    var fetchedResults: Observable<[Result]> = Observable([]) //2
    var errorMessage: Observable<String?> = Observable(nil)
    var error: Observable<Bool> = Observable(false)

    var apiManager: Service?

    
    init(manager: Service = Service.shared) {
        self.apiManager = manager
    }

    func setAPIManager(manager: Service) {
        self.apiManager = manager
    }

    func fetchFromCloud() {

        // if success set fetched result
        // if failure set error
    }

    func setError(_ message: String) {
        self.errorMessage = Observable(message)
        self.error = Observable(true)
    }

}

class Result: NSObject {
    
}

class Service {
    static let shared = Service()
    private init() {}
}
