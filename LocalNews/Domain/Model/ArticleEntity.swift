import Foundation

struct ArticleEntity {
    let urlPath: String
    let title: String
    let content: String
}

extension ArticleEntity {
    func convertToPresentation() -> Article {
        Article(
            urlPath: urlPath,
            title: title,
            content: content
        )
    }
}
