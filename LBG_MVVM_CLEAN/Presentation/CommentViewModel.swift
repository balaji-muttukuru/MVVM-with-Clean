//
//  CommentViewModel.swift
//  LBG_MVVM_CLEAN
//
//  Created by Rajeswari on 05/10/26.
//

import Foundation
import Combine

@MainActor
final class CommentViewModel: ObservableObject {

    @Published var comments: [Comment] = []

    @Published var isLoading = false

    @Published var errorMessage: String?

    private let getCommentsUseCase: GetCommentsUseCaseProtocol

    init(
        getCommentsUseCase: GetCommentsUseCaseProtocol
    ) {
        self.getCommentsUseCase = getCommentsUseCase
    }

    func fetchComments() async {

        isLoading = true
        errorMessage = nil

        do {

            comments = try await getCommentsUseCase.execute()

        } catch {

            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
