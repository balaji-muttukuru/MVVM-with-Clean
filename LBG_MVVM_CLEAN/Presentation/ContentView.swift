//
//  ContentView.swift
//  LBG_MVVM_CLEAN
//
//  Created by Rajeswari on 05/10/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel: CommentViewModel

    init() {

        let apiService = CommentAPIService()

        let repository = CommentRepositoryImpl(
            apiService: apiService
        )

        let useCase = GetCommentsUseCase(
            repository: repository
        )

        _viewModel = StateObject(
            wrappedValue: CommentViewModel(
                getCommentsUseCase: useCase
            )
        )
    }

    var body: some View {

        NavigationStack {

            Group {

                if viewModel.isLoading {

                    ProgressView("Loading...")

                } else if let error = viewModel.errorMessage {

                    VStack(spacing: 12) {

                        Text("Something went wrong")
                            .font(.headline)

                        Text(error)
                            .foregroundStyle(.secondary)

                        Button("Retry") {
                            Task {
                                await viewModel.fetchComments()
                            }
                        }
                    }

                } else {

                    List(viewModel.comments) { comment in

                        VStack(
                            alignment: .leading,
                            spacing: 6
                        ) {

                            Text(comment.name)
                                .font(.headline)

                            Text(comment.email)
                                .font(.subheadline)
                                .foregroundStyle(.blue)

                            Text(comment.body)
                                .font(.body)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Comments")
            .task {

                await viewModel.fetchComments()
            }
        }
    }
}

#Preview {
    ContentView()
}
