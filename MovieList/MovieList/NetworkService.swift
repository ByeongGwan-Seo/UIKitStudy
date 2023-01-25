//
//  NetworkService.swift
//  MovieList
//
//  Created by seobyeonggwan on 2023/01/16.
//

import Foundation
import UIKit

class NetworkService {
    
    var term = ""
    
    func requestMovieAPI(completion: @escaping((_ model: MovieModel?) -> Void)) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        var components = URLComponents(string: "https://itunes.apple.com/search")
        
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        
        components?.queryItems = [term, media]
        
        guard let url = components?.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            print(( response as? HTTPURLResponse )?.statusCode ?? 0)
            
            if let hasData = data {
                do {
                    let movieModel =  try JSONDecoder().decode(MovieModel.self, from: hasData)
                    
                    print(movieModel)
                    print("1")
                    completion(movieModel)
                    //클로저를 사용해서 해당 통신이 끝났을때 신호를 받아서 처리하는 방법
                } catch {
                    print(error)
                    completion(nil)
                }
            }
        }
        task.resume()
        print("2")
        session.finishTasksAndInvalidate()
        print("3")
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        if let hasURL = URL(string: urlString) {
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            
            session.dataTask(with: request) { data, response, error in
//                print("response - ", response?.url, "status code - ", (response as? HTTPURLResponse)?.statusCode ?? 1)

                if let hasData = data {
                    completion(UIImage(data: hasData) ?? UIImage())
                    return
                }
            }.resume()
        }
        completion(UIImage())
    }
}
