//
//  MarvelClient.swift
//  Marvel
//
//  Created by Cloy Vserv on 01/12/22.
//

import Foundation
import CryptoKit

enum HttpClientError: Error {
    case badURL
    case unknownError
    case errorHttpResponse
    case notFound
    case unknownResponseCode
    case invalidData
}

class HttpClient {
    private var endPoint = "https://gateway.marvel.com:443/v1/public/characters?"
    private let publicKey: String
    private let privateKey: String
    init(publicKey: String, privateKey: String) {
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    func fetch(offset: Int, limit: Int, completionHandler: @escaping (Result<ClientResponse,Error>) -> Void) {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(string:"\(ts)\(privateKey)\(publicKey)")
        endPoint += "apikey=\(publicKey)"
        endPoint += "&hash=\(hash)"
        endPoint += "&ts=\(ts)"
        endPoint += "&offset=\(offset)"
        endPoint += "&limit=\(limit)"
        guard let url = URL(string: endPoint) else {
            completionHandler(.failure(HttpClientError.badURL))
            return
        }
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = Double(3.0)
        let urlSessionDataTask = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard error == nil else {
                completionHandler(.failure(HttpClientError.unknownError))
                return
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                completionHandler(.failure(HttpClientError.errorHttpResponse))
                return
            }
            if httpResponse.statusCode == 404 {
                completionHandler(.failure(HttpClientError.notFound))
                return
            }
            if httpResponse.statusCode != 200 {
                completionHandler(.failure(HttpClientError.unknownResponseCode))
                return
            }
            guard let data = data else {
                completionHandler(.failure(HttpClientError.invalidData))
                return
            }
            let decoder = JSONDecoder()
            do {
                print("Client data received")
                let response = try decoder.decode(ClientResponse.self, from: data)
                completionHandler(.success(response))
            } catch let error {
                print("error:\(error)")
                completionHandler(.failure(HttpClientError.unknownError))
            }
        }
        urlSessionDataTask.resume()
    }
}

extension HttpClient {
    func MD5(string: String) -> String {
        if #available(iOS 13.0, *) {
            let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
            return digest.map {
                String(format: "%02hhx", $0)
            }.joined()
        } else {
            return ""
        }
    }
}
