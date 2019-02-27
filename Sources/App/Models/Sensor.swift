import Vapor
import FluentSQLite

final class Sensor: Codable {
    var id: Int?
    var value: String
    init(value: String) {
        self.value = value
    }
}

extension Sensor: SQLiteModel {}

//Migration protocol is that this protocol is used to create a table for the model in the database
extension Sensor: Migration {}

extension Sensor: Content {}

extension Sensor: Parameter {}
