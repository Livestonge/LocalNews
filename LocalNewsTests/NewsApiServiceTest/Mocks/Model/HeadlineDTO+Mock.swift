import Foundation

struct HeadlineDTOMock {
    let imageUrlPath: String
    let title: String
    let source: String
    let publishedAt: Date
    var article: ArticleDTOMock
}

extension HeadlineDTOMock: Equatable {
    static func ==(lhs: HeadlineDTOMock, rhs: HeadlineDTOMock) -> Bool {
        lhs.title == rhs.title && lhs.source == rhs.source &&
        lhs.article == rhs.article
    }
}

extension HeadlineDTO {
    func convertToMock() -> HeadlineDTOMock {
        HeadlineDTOMock(
            imageUrlPath: imageUrlPath,
            title: title,
            source: source,
            publishedAt: publishedAt,
            article: article.convertToMock()
        )
    }
}
