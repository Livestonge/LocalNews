import Foundation

struct Headline: Identifiable {
    var id = UUID()
    let imageUrlPath: String
    let title: String
    let source: String
    let publishedAt: String
    let article: Article
}

extension Headline {
    static let mock = Headline(
        imageUrlPath: "",
        title: """
la reforme de la retraite a commencé à être deja
 dsfsdfgresdfd fcsxcwxcxwcxwcwx cwxcx wcxwcxwcwxcwxcwx
 cwxcxwcwxcwcwxcwxcwxcwxcwxcwxccsqqsdqsdsqdsdsqdsqdsqdsqdd
""",
        source: "France Info",
        publishedAt: "Aujourdhui",
        article: .mock
    )
}
