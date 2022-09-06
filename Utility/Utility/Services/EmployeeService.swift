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

    let employeeJson = """
    {
      "status": "success",
      "data": [
        {
          "id": 1,
          "employee_name": "Tiger Nixon",
          "employee_salary": 320800,
          "employee_age": 61,
          "profile_image": "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.webp?s=612x612&w=is&k=20&c=Y-sEnmRyacoG3NlkJBox243kZKd0dxhdSY7RMTGNO1k="
        },
        {
          "id": 2,
          "employee_name": "Garrett Winters",
          "employee_salary": 170750,
          "employee_age": 63,
          "profile_image": ""
        },
        {
          "id": 3,
          "employee_name": "Ashton Cox",
          "employee_salary": 86000,
          "employee_age": 66,
          "profile_image": "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.webp?s=612x612&w=is&k=20&c=tSDvNq3h5oTvHeIb0vHOrxQZ7M9RmYC5EOeGeV0r3Qc="
        },
        {
          "id": 4,
          "employee_name": "Cedric Kelly",
          "employee_salary": 433060,
          "employee_age": 22,
          "profile_image": ""
        },
        {
          "id": 5,
          "employee_name": "Airi Satou",
          "employee_salary": 162700,
          "employee_age": 33,
          "profile_image": "https://media.istockphoto.com/id/1344327532/photo/studio-portrait-of-attractive-19-year-old-woman-with-brown-hair.webp?s=612x612&w=is&k=20&c=1-33A64c41IlB4Ft6ZX7y5gzlWkqtqxY9iWykEV_EdE="
        },
        {
          "id": 6,
          "employee_name": "Brielle Williamson",
          "employee_salary": 372000,
          "employee_age": 61,
          "profile_image": "https://media.istockphoto.com/id/1338134319/photo/portrait-of-young-indian-businesswoman-or-school-teacher-pose-indoors.webp?s=612x612&w=is&k=20&c=35vO6NFpatUqzELTbL-qrbTOkJuRqV5xAxkg5NU1cww="
        },
        {
          "id": 7,
          "employee_name": "Herrod Chandler",
          "employee_salary": 137500,
          "employee_age": 59,
          "profile_image": "https://media.istockphoto.com/id/1137004538/photo/close-up-profile-side-view-portrait-of-his-he-nice-handsome-attractive-bearded-candid-guy.webp?s=612x612&w=is&k=20&c=ZjE4qVbQQt7bh3diwWbuO_8U8f4XWK85Mdjf-6pG8No="
        },
        {
          "id": 8,
          "employee_name": "Rhona Davidson",
          "employee_salary": 327900,
          "employee_age": 55,
          "profile_image": ""
        },
        {
          "id": 9,
          "employee_name": "Colleen Hurst",
          "employee_salary": 205500,
          "employee_age": 39,
          "profile_image": "https://media.istockphoto.com/id/1344327532/photo/studio-portrait-of-attractive-19-year-old-woman-with-brown-hair.webp?s=612x612&w=is&k=20&c=1-33A64c41IlB4Ft6ZX7y5gzlWkqtqxY9iWykEV_EdE="
        },
        {
          "id": 10,
          "employee_name": "Sonya Frost",
          "employee_salary": 103600,
          "employee_age": 23,
          "profile_image": ""
        },
        {
          "id": 11,
          "employee_name": "Jena Gaines",
          "employee_salary": 90560,
          "employee_age": 30,
          "profile_image": ""
        },
        {
          "id": 12,
          "employee_name": "Quinn Flynn",
          "employee_salary": 342000,
          "employee_age": 22,
          "profile_image": "https://media.istockphoto.com/id/992875640/photo/young-man-with-serious-expression-against-gray-background.webp?s=612x612&w=is&k=20&c=tfXHamUgeh59W1mgBzs_8KwjSCpCnSRGgZ4NQMM46Zc="
        },
        {
          "id": 13,
          "employee_name": "Charde Marshall",
          "employee_salary": 470600,
          "employee_age": 36,
          "profile_image": "https://media.istockphoto.com/id/1368424494/photo/studio-portrait-of-a-cheerful-woman.webp?s=612x612&w=is&k=20&c=S6Je1dyOxHNSMuE3mweAATneAAH9l3u9zdJqN8S0xxc="
        },
        {
          "id": 14,
          "employee_name": "Haley Kennedy",
          "employee_salary": 313500,
          "employee_age": 43,
          "profile_image": ""
        },
        {
          "id": 15,
          "employee_name": "Tatyana Fitzpatrick",
          "employee_salary": 385750,
          "employee_age": 19,
          "profile_image": ""
        },
        {
          "id": 16,
          "employee_name": "Michael Silva",
          "employee_salary": 198500,
          "employee_age": 66,
          "profile_image": "https://media.istockphoto.com/id/1325013514/photo/young-man-portrait.webp?s=612x612&w=is&k=20&c=n8rW-1dTq5gY6Tl81uyo9LQRxLvoJWkF4Ss0EqXLrgY="
        },
        {
          "id": 17,
          "employee_name": "Paul Byrd",
          "employee_salary": 725000,
          "employee_age": 64,
          "profile_image": "https://media.istockphoto.com/id/1193831898/photo/smiling-good-looking-young-man-looks-off-camera.webp?s=612x612&w=is&k=20&c=BohMw6ur7k1mFCPaTq7MQ9fvGDQBZuRhAK_Hcgei61w="
        },
        {
          "id": 18,
          "employee_name": "Gloria Little",
          "employee_salary": 237500,
          "employee_age": 59,
          "profile_image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
        },
        {
          "id": 19,
          "employee_name": "Bradley Greer",
          "employee_salary": 132000,
          "employee_age": 41,
          "profile_image": ""
        },
        {
          "id": 20,
          "employee_name": "Dai Rios",
          "employee_salary": 217500,
          "employee_age": 35,
          "profile_image": "https://media.istockphoto.com/id/1367668208/photo/studio-shot-of-an-attractive-young-woman-posing-against-a-grey-background.webp?s=612x612&w=is&k=20&c=Kr5PkD5dHvxxqz54hoopX2jDgMFDe0uEfNq0QQ5e1-4="
        },
        {
          "id": 21,
          "employee_name": "Jenette Caldwell",
          "employee_salary": 345000,
          "employee_age": 30,
          "profile_image": ""
        },
        {
          "id": 22,
          "employee_name": "Yuri Berry",
          "employee_salary": 675000,
          "employee_age": 40,
          "profile_image": ""
        },
        {
          "id": 23,
          "employee_name": "Caesar Vance",
          "employee_salary": 106450,
          "employee_age": 21,
          "profile_image": ""
        },
        {
          "id": 24,
          "employee_name": "Doris Wilder",
          "employee_salary": 85600,
          "employee_age": 23,
          "profile_image": ""
        }
      ],
      "message": "Successfully! All records has been fetched."
    }
    """
    func getEmployeeData(completion: @escaping ([Employee]?, Error?) -> Void) {
        let data = employeeJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(EmployeeResponse.self, from: data)
            completion(response.data, nil)
        } catch let error {
            completion(nil, error)
        }
    }
//    private let sourcesURL = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
//    func getEmployeeData(completion: @escaping ([Employee]?, Error?) -> Void) {
//        URLSession.shared.dataTask(with: sourcesURL) { data, response, error in
//            guard error == nil else {
//                completion(nil, error)
//                return
//            }
//
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let employeeResponse = try decoder.decode(EmployeeResponse.self, from: data)
//                    completion(employeeResponse.data, nil)
//                } catch let error {
//                    completion(nil, error)
//                }
//            }
//        }.resume()
//    }
}
