//
//  ApiManager.swift
//  FikFis
//
//  Created by sveltetech on 28/10/24.
//

import Foundation

struct DefaultResponse: Codable {
    let status: Int?
    let error: Int?
    let message: String?
    let messages: MessageResponse?
}

struct MessageResponse: Codable {
    let error: String?
}

class ApiManager {

    static let shared = ApiManager() // Singleton instance for reuse
    private init() {}
    
    /// Generic method to send multipart/form-data request and parse the response
    /// - Parameters:
    ///   - url: API endpoint
    ///   - method: HTTP method (GET, POST, etc.)
    ///   - parameters: Dictionary of parameters (e.g., text fields)
    ///   - fileData: File data to upload (e.g., image)
    ///   - fileName: File name for the file being uploaded
    ///   - mimeType: MIME type of the file
    ///   - responseType: The type of the expected response that conforms to Decodable
    ///   - completion: Completion handler with decoded response or error
    func request<T: Decodable>(
        to url: String,
        method: HTTPMethod = .POST, // Default to POST
        parameters: [String: String],
        fileData: Data?,
        fileName: String?,
        mimeType: String?,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let requestUrl = URL(string: "\(baseURL)\(url)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = method.rawValue

        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()

        // Add parameters to the body
        for (key, value) in parameters {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.append("\(value)\r\n")
        }

        // Add file data if available
        if let fileData = fileData {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n")
            body.append("Content-Type: \(mimeType)\r\n\r\n")
            body.append(fileData)
            body.append("\r\n")
        }

        // End boundary
        body.append("--\(boundary)--\r\n")

        request.httpBody = body

        // Send the request using URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No response data", code: 500, userInfo: nil)))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
