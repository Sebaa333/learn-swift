import Foundation
import SwiftData

@Model
final class FavoriteMeal {
    @Attribute(.unique) var id: String
    var name: String
    var thumbnail: URL?
    var addedAt: Date

    init(id: String, name: String, thumbnail: URL?) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.addedAt = .now
    }
}
