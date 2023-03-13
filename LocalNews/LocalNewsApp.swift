import SwiftUI

@main
struct LocalNewsApp: App {
    @ObservedObject var viewModel: ViewModel = .init(
        useCase: NewsUseCase(
            fetchNewsRepository: FetchNewsRepository(
                dataSource: NewsApiService(
                    networkClient: NetworClient()
                )
            )
        )
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
