import Foundation

struct ArticleDTO {
    let urlPath: String
    let imageUrlPath: String
    let title: String
    let content: String
}

extension ArticleDTO {
    func convertToDomain() -> ArticleEntity {
        ArticleEntity(
            urlPath: urlPath,
            imageUrlPath: imageUrlPath,
            title: title,
            content: content
        )
    }
}
