import SwiftUI

struct NewsRow: View {
    private let imageUrlPath: String
    private let title: String
    private let source: String
    private let publishedAt: String
    
    init(headline: Headline = .mock) {
        imageUrlPath = headline.imageUrlPath
        title = headline.title
        source = headline.source
        publishedAt = headline.publishedAt
    }
    
    var body: some View {
        HStack {
            ImageView(imageUrlPath: imageUrlPath)
            .frame(width: 50, height: 50)
            .cornerRadius(10)
            VStack {
                Text(title)
                    .lineLimit(3)
                HStack {
                    Text(source)
                        .font(.body)
                        .foregroundColor(.indigo)
                        .italic()
                    Spacer()
                    Text(publishedAt)
                        .font(.body)
                        .italic()
                    .padding(.trailing, 10)
                }
                .frame(maxWidth: .infinity)
                
            }
        }
        
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow()
    }
}
