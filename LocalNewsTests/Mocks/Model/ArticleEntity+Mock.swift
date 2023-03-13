import Foundation

struct ArticleEntityMock: Equatable {
    let urlPath: String
    let title: String
    let content: String
}

extension ArticleEntity {
    func convertToMockEntity() -> ArticleEntityMock {
        ArticleEntityMock(
            urlPath: urlPath,
            title: title,
            content: content
        )
    }
}
