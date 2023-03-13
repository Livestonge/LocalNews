import Foundation

class NewsApiService: FetchNewsRemoteProtocol {
    private var urlComponent: URLComponents
    private let networkClient: any NetworkClientProtocol
    
    init(networkClient: any NetworkClientProtocol) {
        urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "newsapi.org"
        urlComponent.path = "/v2/top-headlines"
        urlComponent.queryItems = [
            URLQueryItem(
                name: "apiKey",
                value: ApiKeys.newsApi
            )
            ]
        self.networkClient = networkClient
    }
    
    func fetchHeadlines(
        parameters: [String : String]
    ) async -> Result<[HeadlineDTO], ResponseError> {
        parameters.forEach { parameter in
            let item = URLQueryItem(
                name: parameter.key,
                value: parameter.value
            )
            self.urlComponent.queryItems?.append(item)
        }
        
        guard let url = urlComponent.url else {
            return .failure(.badUrlError)
        }
        
        let request = URLRequest(url: url)
        let result = await networkClient.execute(request: request)
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let result = try decoder.decode(
                    ArticlesNewsApi.self,
                    from: data
                )
                let headlines = result.articles
                return .success(headlines)
            } catch  {
                return .failure(.decodingError)
            }
        case .failure(let responseError):
                return .failure(responseError)
        }
        
        
    }
}
