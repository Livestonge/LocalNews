import Foundation

struct ArticlesNewsApi: Decodable {
    let status: String
    let articles: [HeadlineDTO]
}
