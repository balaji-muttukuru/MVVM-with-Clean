//
//  CommentDTO.swift
//  LBG_MVVM_CLEAN
//
//  Created by Rajeswari on 05/10/26.
//

import Foundation

struct CommentDTO: Decodable {

    let id: Int
    let name: String
    let email: String
    let body: String
}

extension CommentDTO {
    func toDomain() -> Comment {
        return Comment(
            id: id,
            name: name,
            email: email,
            body: body
        )
    }
}
