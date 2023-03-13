import Foundation

extension Array where Element == HeadlineDTO {
    static var decodedHeadlineDTO: [HeadlineDTO] = [
        HeadlineDTO(
            imageUrlPath: "",
            title: "DIRECT. Réforme des retraites",
            source: "Google News",
            publishedAt: Date() ,
            article: ArticleDTO(
                urlPath: "https://news.google.com/rss/articles/CBMixgFodHRwczovL3d3dy5mcmFuY2V0dmluZm8uZnIvZWNvbm9taWUvcmV0cmFpdGUvcmVmb3JtZS1kZXMtcmV0cmFpdGVzL2RpcmVjdC1yZWZvcm1lLWRlcy1yZXRyYWl0ZXMtbGEtY29tbWlzc2lvbi1taXh0ZS1wYXJpdGFpcmUtbi1lc3QtcGFzLWpvdWVlLWQtYXZhbmNlLXByZXZpZW50LWxlLWNoZWYtZGVzLXNlbmF0ZXVycy1scl81NzA2OTE0Lmh0bWzSAQA?oc=5",
                title: "DIRECT. Réforme des retraites",
                content: "No content available, please visit the source website to read more"
            )
        )
    ]
    
    func convertToMocks() -> [HeadlineDTOMock] {
        self.map { $0.convertToMock() }
    }
}
