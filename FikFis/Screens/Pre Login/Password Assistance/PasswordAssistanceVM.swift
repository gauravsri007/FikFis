//
//  PasswordAssistanceVM.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import Foundation

class PasswordAssistanceVM: ObservableObject {
    
    @Published var responseMessage: String = ""
    
    func forgotPasswordRequest(username: String, completion: @escaping (Result<DefaultResponse, Error>,Int) -> Void) {
        // Define the parameters to send
        let parameters: [String: String] = [
            "username": username
        ]
        
        // Call the API to register OTP
        ApiManager.shared.request(
            to: "forgotPasswordRequest",
            method: .POST,
            parameters: parameters,
            fileData: nil,
            fileName: nil,
            mimeType: nil,
            bearerToken: "",
            responseType: DefaultResponse.self
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
