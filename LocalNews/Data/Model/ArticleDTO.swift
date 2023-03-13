import Foundation

struct ArticleDTO {
    let urlPath: String
    let title: String
    let content: String
}

extension ArticleDTO {
    func convertToDomain() -> ArticleEntity {
        ArticleEntity(
            urlPath: urlPath,
            title: title,
            content: content
        )
    }
}
