import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Post: SQLiteModel {
    /// The unique identifier for this `Todo`.
    var id: Int?

    /// A title describing what this `Todo` entails.
    var title: String

    var text: String

    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String, text: String) {
        self.id = id
        self.title = title
        self.text = text
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Post: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Post: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Post: Parameter { }
