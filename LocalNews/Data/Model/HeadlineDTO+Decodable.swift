import Foundation

extension HeadlineDTO: Decodable {
    
    enum NestedCodingKeys: CodingKey {
        case name
    }
    
    enum CodinKeys: String, CodingKey {
        case source
        case title
        case url
        case imageUrlPath = "urlToImage"
        case publishedAt
        case content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodinKeys.self)
        imageUrlPath = try container.decodeIfPresent(
            String.self,
            forKey: .imageUrlPath
        ) ?? ""
        title = try container.decodeIfPresent(
            String.self,
            forKey: .title
        ) ?? ""
        let url = try container.decodeIfPresent(
            String.self,
            forKey: .url
        ) ?? ""
        publishedAt = try container.decodeIfPresent(
            Date.self,
            forKey: .publishedAt)
        ?? Date()
        let content = try container.decodeIfPresent(
            String.self,
            forKey: .content
        ) ?? """
No content available, please visit the source website to read more
"""
        let nestedContainer = try container.nestedContainer(
            keyedBy: NestedCodingKeys.self,
            forKey: .source
        )
        source = try nestedContainer.decodeIfPresent(
            String.self,
            forKey: .name
        ) ?? ""
        
        article = ArticleDTO(
            urlPath: url,
            title: title,
            content: content
        )
    }
}
