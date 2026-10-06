//
//  CommentAPIService.swift
//  LBG_MVVM_CLEAN
//
//  Created by Rajeswari on 05/10/26.
//

import Foundation

protocol CommentAPIServiceProtocol {

    func fetchComments() async throws -> [CommentDTO]
}


final class CommentAPIService: CommentAPIServiceProtocol {

    func fetchComments() async throws -> [CommentDTO] {

        guard let url = URL(
            string: "https://jsonplaceholder.typicode.com/comments"
        ) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(
            from: url
        )

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {

            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(
            [CommentDTO].self,
            from: data
        )
    }
}
