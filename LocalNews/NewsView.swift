import SwiftUI

struct NewsView: View {
    private let imageUrlPath: String
    private let title: String
    private let content: String
    
    init(article: Article) {
        imageUrlPath = article.urlPath
        title = article.title
        content = article.content
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .trailing, spacing: 20) {
                ZStack(alignment: .bottom) {
                    ImageView(imageUrlPath: imageUrlPath)
                    .frame(
                        width: geo.size.width,
                        height: geo.size.height * 0.4
                    )
                    Text(title)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.1))
                }
                .padding(.bottom, 20)
                TextField(
                    "",
                    text: .constant(content),
                    axis: .vertical
                )
                .disabled(true)
                .lineSpacing(5)
                .lineLimit(10)
                .padding(.horizontal, 10)
                Button(
                    action: {},
                    label: {
                        Text("read more".capitalized)
                            .bold()
                    }
                )
                .padding(.trailing, 10)
                }
            }
        }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(article: .mock)
    }
}

