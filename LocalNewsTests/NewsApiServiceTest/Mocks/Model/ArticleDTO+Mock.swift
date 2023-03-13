import Foundation

struct ArticleDTOMock: Equatable {
    let urlPath: String
    let title: String
    let content: String
}

extension ArticleDTO {
    func convertToMock() -> ArticleDTOMock {
        ArticleDTOMock(
            urlPath: urlPath,
            title: title,
            content: content
        )
    }
}
