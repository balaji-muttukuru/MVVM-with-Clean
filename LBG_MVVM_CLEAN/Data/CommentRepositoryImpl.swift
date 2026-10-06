//
//  CommentRepositoryImpl.swift
//  LBG_MVVM_CLEAN
//
//  Created by Rajeswari on 05/10/26.
//

import Foundation

final class CommentRepositoryImpl: CommentRepository {

    private let apiService: CommentAPIServiceProtocol

    init(
        apiService: CommentAPIServiceProtocol
        = CommentAPIService()
    ) {
        self.apiService = apiService
    }

    func fetchComments() async throws -> [Comment] {

        let commentDTOs = try await apiService.fetchComments()

        return commentDTOs.map {
            $0.toDomain()
        }
    }
}
