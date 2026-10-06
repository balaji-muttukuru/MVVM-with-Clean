//
//  CommentRepository.swift
//  LBG_MVVM_CLEAN
//
//  Created by Rajeswari on 05/10/26.
//

import Foundation

protocol CommentRepository {

    func fetchComments() async throws -> [Comment]
}
