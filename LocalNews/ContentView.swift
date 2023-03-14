import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
            NavigationStack {
                List(viewModel.headlines) { headline in
                    NavigationLink(
                        destination: NewsView(
                            article: headline.article
                        )
                    ) {
                        NewsRow(headline: headline)
                    }
                }
            }
            .alert(
                viewModel.errorMessage(),
                isPresented: $viewModel.errorDidOccurr
            ) {
                Button("OK", role: .cancel) {}
            }
            .onAppear {
               viewModel.fetchHeadlines()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(
                ViewModel(
                    useCase: NewsUseCase(
                        fetchNewsRepository: FetchNewsRepository(
                            dataSource: NewsApiService(
                                networkClient: NetworClient()
                            )
                        )
                    )
                )
            )
    }
}
