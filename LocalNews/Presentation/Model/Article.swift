import Foundation

struct Article {
    let urlPath: String
    let title: String
    let content: String
}

extension Article {
    static let mock = Article(
        urlPath: "",
        title: "La reforme de la retraite",
        content: """
        Adopter via cette procédure hâtive une réforme à la fois très impactante pour la vie de dizaines de millions de gens, injuste de notre point de vue et mal bricolée, ce serait une forme de vice démocratique », poursuit-il
"""
    )
}
