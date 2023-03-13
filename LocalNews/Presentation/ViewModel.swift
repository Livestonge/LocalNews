import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var headlines = [Headline]()
    @Published var errorDidOccurr = false
    
    var errorMessage: String {
        didSet {
            errorDidOccurr = errorMessage == "" ? false : true
        }
    }
    
    private var newsUseCase: any NewsUseCaseProtocol
    private let dateFormatter: RelativeDateTimeFormatter
    
    init(useCase: any NewsUseCaseProtocol) {
        newsUseCase = useCase
        errorMessage = ""
        dateFormatter = RelativeDateTimeFormatter()
        dateFormatter.unitsStyle = .short
    }
    
    func fetchHeadlines(parameters: [String: String] = [
        "language": "fr"
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
                self.errorMessage = ""
            case .failure(let error):
                self.errorMessage = error.description
            }
        }
    }
}
