import Foundation

struct HeadlineEntityMock: Equatable {
    let imageUrlPath: String
    let title: String
    let source: String
    let publishedAt: Date
    let article: ArticleEntityMock
}

extension HeadlineEntity {
    func convertToMockEntity() -> HeadlineEntityMock {
        HeadlineEntityMock(
            imageUrlPath: imageUrlPath,
            title: title,
            source: source,
            publishedAt: publishedAt,
            article: article.convertToMockEntity()
        )
    }
    
}
