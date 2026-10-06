//
//  GetCommentsUseCase.swift
//  LBG_MVVM_CLEAN
//
//  Created by Rajeswari on 05/10/26.
//

import Foundation

protocol GetCommentsUseCaseProtocol {

    func execute() async throws -> [Comment]
}


final class GetCommentsUseCase: GetCommentsUseCaseProtocol {

    private let repository: CommentRepository

    init(repository: CommentRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Comment] {

        return try await repository.fetchComments()
    }
}
