import Foundation

extension Array where Element == HeadlineEntity {
    static var nonEmpty: [HeadlineEntity] = [
    HeadlineEntity(
        imageUrlPath: "",
        title: "title_1",
        source: "source",
        publishedAt: Date(),
        article: ArticleEntity(
            urlPath: "url",
            imageUrlPath: "",
            title: "title",
            content: "content"
        )
    ),
    HeadlineEntity(
        imageUrlPath: "",
        title: "title_2",
        source: "source_2",
        publishedAt: Date(),
        article: ArticleEntity(
            urlPath: "url_2",
            imageUrlPath: "",
            title: "title_2",
            content: "content_2"
        )
    ),
    HeadlineEntity(
        imageUrlPath: "",
        title: "title_3",
        source: "source_3",
        publishedAt: Date(),
        article: ArticleEntity(
            urlPath: "url_3",
            imageUrlPath: "",
            title: "title_3",
            content: "content_3"
        )
    )
    ]
    
    func convertToEntityMocks() -> [HeadlineEntityMock] {
        self.map { $0.convertToMockEntity() }
    }
}
