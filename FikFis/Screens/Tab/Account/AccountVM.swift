//
//  LogoutVM.swift
//  FikFis
//
//  Created by apple on 17/11/24.
//

import Foundation

class LogoutVM: ObservableObject {
    
    @Published var responseMessage: String = ""

    func logoutAPI(completion: @escaping (Result<DefaultResponse, Error>,Int) -> Void) {
        // Define the parameters to send
        let parameters: [String: Any] = [
            "device_token": Udefault.value(forKey: KEY_DEVICE_TOKEN)!,
        ]
        print("parameters \(parameters)")
        // Call the API to register OTP
       
        ApiManager.shared.request(
            to: "logout",
            method: .POST,
            parameters: parameters,
            fileData: nil,
            fileName: nil,
            mimeType: nil,
            bearerToken: Udefault.value(forKey: KEY_ACCESS_TOKEN) as! String,
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
    
    func clearLocalData() {
        Udefault.set(false, forKey: KEY_IS_LOGGEDIN)
        Udefault.synchronize()
    }
    
}
