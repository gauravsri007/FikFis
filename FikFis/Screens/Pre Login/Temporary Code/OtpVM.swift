//
//  OtpVM.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import Foundation


class OtpVM: ObservableObject {
    
    @Published var responseMessage: String = ""

    func registerUserAPI(userName : String,password: String,otp: String,completion: @escaping (Result<LoginResponse, Error>,Int) -> Void) {
        // Define the parameters to send
        let parameters: [String: Any] = [
            "username": userName,
            "password": password,
            "otp": otp,
            "device_type": "ios",
            "device_token": Udefault.value(forKey: KEY_DEVICE_TOKEN)!,
            "fcm_token": "AxtyAdkasadad565asd",
        ]
        print("parameters \(parameters)")
        // Call the API to register OTP
        ApiManager.shared.request(
            to: "otpValidation",
            method: .POST,
            parameters: parameters,
            fileData: nil,
            fileName: nil,
            mimeType: nil,
            bearerToken: "",
            responseType: LoginResponse.self
        ) { [weak self] result,statusCode  in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.responseMessage = response.message ?? "" // Update with the response message
                    print(response.message)
                    completion(.success(response), statusCode) // Trigger the success completion
                    
                case .failure(let error):
                    self?.responseMessage = "Error: \(error.localizedDescription)"
                    completion(.failure(error), statusCode) // Trigger the failure completion
                }
            }
        }
    }
    
    
    func otpValidationAPI(userName : String,otp: String,completion: @escaping (Result<OtpValidationResponse, Error>,Int) -> Void) {
        // Define the parameters to send
        let parameters: [String: Any] = [
            "username": userName,
            "otp": otp,
        ]
        print("parameters \(parameters)")
        // Call the API to register OTP
        ApiManager.shared.request(
            to: "otpValidation",
            method: .POST,
            parameters: parameters,
            fileData: nil,
            fileName: nil,
            mimeType: nil,
            bearerToken: "",
            responseType: OtpValidationResponse.self
        ) { [weak self] result,statusCode  in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.responseMessage = response.message ?? "" // Update with the response message
                    print(response.message)
                    completion(.success(response), statusCode) // Trigger the success completion
                    
                case .failure(let error):
                    self?.responseMessage = "Error: \(error.localizedDescription)"
                    completion(.failure(error), statusCode) // Trigger the failure completion
                }
            }
        }
    }
    
    
        
}


struct OtpResponse: Codable {
    let status: Int?
    let error: Int?
    let message: String?
    let messages: String?
    let refresh_token: String?
    let access_token: String?
    let username: String?
    let phone: String?
    let email: String?
}

struct OtpValidationResponse: Codable {
    let message: String?
    let otp_key: String?
}
