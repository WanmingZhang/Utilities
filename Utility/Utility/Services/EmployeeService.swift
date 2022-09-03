//
//  EmployeeService.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/1/22.
//

import Foundation

protocol EmployeeServiceProtocol {
    func getEmployeeData(completion: @escaping ([Employee]?, Error?) -> Void)
}


class EmployeeService: EmployeeServiceProtocol {

    private let sourcesURL = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
    func getEmployeeData(completion: @escaping ([Employee]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: sourcesURL) { data, response, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let employeeResponse = try decoder.decode(EmployeeResponse.self, from: data)
                    completion(employeeResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
