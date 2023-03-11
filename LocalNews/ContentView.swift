import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationStack {
                List(0..<5) { _ in
                    NavigationLink(
                        destination: NewsView(
                            article: .mock
                        )
                    ) {
                        NewsRow()
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
