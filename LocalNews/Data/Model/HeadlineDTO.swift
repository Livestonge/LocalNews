import Foundation

struct HeadlineDTO {
    let imageUrlPath: String
    let title: String
    let source: String
    let publishedAt: Date
    var article: ArticleDTO
}

extension HeadlineDTO {
    func convertToDomain() -> HeadlineEntity {
        HeadlineEntity(
            imageUrlPath: imageUrlPath,
            title: title,
            source: source,
            publishedAt: publishedAt,
            article: article.convertToDomain()
        )
    }
}
