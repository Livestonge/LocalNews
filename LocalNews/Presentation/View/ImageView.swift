import SwiftUI

struct ImageView: View {
    let imageUrlPath: String
    
    var body: some View {
        AsyncImage(
            url: URL(string: imageUrlPath),
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            },
            placeholder: {
                Image("localNews")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            })
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrlPath: "")
    }
}
