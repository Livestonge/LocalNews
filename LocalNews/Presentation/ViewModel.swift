import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published private(set) var headlines = [Headline]()
    @Published var errorDidOccurr = false
    
    private var _errorMessage: String {
        didSet {
            errorDidOccurr = _errorMessage == "" ? false : true
        }
    }
    
    private var newsUseCase: any NewsUseCaseProtocol
    private let dateFormatter: RelativeDateTimeFormatter
    
    init(useCase: any NewsUseCaseProtocol) {
        newsUseCase = useCase
        _errorMessage = ""
        dateFormatter = RelativeDateTimeFormatter()
        dateFormatter.unitsStyle = .short
    }
    
    func fetchHeadlines(parameters: [String: String] = [
        "language": "en"
    ]) {
        Task {
            let result = await newsUseCase.fetchHeadlines(
                parameters: parameters
            )
            
            switch result {
            case .success(let headlines):
                self.headlines = headlines.map { headline in
                    let date = headline.publishedAt
                    let publishedAt = dateFormatter.localizedString(
                        for: date,
                        relativeTo: Date()
                    )
                    return Headline(
                        imageUrlPath: headline.imageUrlPath,
                        title: headline.title,
                        source: headline.source,
                        publishedAt: publishedAt,
                        article: headline.article.convertToPresentation()
                    )
                }
                self._errorMessage = ""
            case .failure(let error):
                self._errorMessage = error.description
            }
        }
    }
    
    func errorMessage() -> String {
        _errorMessage
    }
}
