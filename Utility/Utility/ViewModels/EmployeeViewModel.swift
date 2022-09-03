//
//  EmployeeViewModel.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/1/22.
//

import Foundation

class EmployeeViewModel {

    var apiManager: EmployeeServiceProtocol
    var employees: Observable<[Employee]> = Observable([])
    var errorMsg: Observable<String?> = Observable(nil)
    
    init(_ apiManager: EmployeeServiceProtocol) {
        self.apiManager = apiManager
    }
    
    func getEmployeeData() {
        apiManager.getEmployeeData { [weak self] (employees, error) in
            guard let self = self else { return }
            guard error == nil else {
                self.errorMsg = Observable(error!.localizedDescription)
                return
            }
            
            guard let employees = employees else {
                self.employees.value = []
                return
            }
            
            self.employees.value = employees
        }
    }
}
