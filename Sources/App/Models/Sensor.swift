import Vapor
import FluentPostgreSQL

final class Sensor: Content {
    var id: UUID?
    var value: String
    init(value: String) {
        self.value = value
    }
}

extension Sensor: PostgreSQLUUIDModel {}
extension Sensor: Migration {}
