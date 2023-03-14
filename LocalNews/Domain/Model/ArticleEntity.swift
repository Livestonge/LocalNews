import Foundation

struct ArticleEntity {
    let urlPath: String
    let imageUrlPath: String
    let title: String
    let content: String
}

extension ArticleEntity {
    func convertToPresentation() -> Article {
        Article(
            urlPath: urlPath,
            imageUrlPath: imageUrlPath,
            title: title,
            content: content
        )
    }
}
