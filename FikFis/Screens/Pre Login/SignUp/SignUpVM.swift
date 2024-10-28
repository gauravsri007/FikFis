//
//  SignUpVM.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import Foundation

class SignUpVM: ObservableObject {
    
    @Published var responseMessage: String = ""
    
    func registerUserOTP(username: String, completion: @escaping (Result<DefaultResponse, Error>) -> Void) {
        // Define the parameters to send
        let parameters: [String: String] = [
            "username": username
        ]
        
        // Call the API to register OTP
        ApiManager.shared.request(
            to: "registerUserOtp",
            method: .POST,
            parameters: parameters,
            fileData: nil,
            fileName: nil,
            mimeType: nil,
            responseType: DefaultResponse.self
        ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.responseMessage = response.message ?? "" // Update with the response message
                    print(response.message)
                    completion(.success(response)) // Trigger the success completion
                    
                case .failure(let error):
                    self?.responseMessage = "Error: \(error.localizedDescription)"
                    completion(.failure(error)) // Trigger the failure completion
                }
            }
        }
    }
}

