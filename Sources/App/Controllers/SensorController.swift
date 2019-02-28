import Vapor

final class SensorController: RouteCollection {
    func creatNewSensor(_ req: Request) throws -> Future<Sensor> {
        return try req.content.decode(Sensor.self).flatMap {
            return $0.save(on: req)
        }
    }
    
    func getAllSensors(_ req: Request) throws -> Future<[Sensor]> {
        return Sensor.query(on: req).decode(Sensor.self).all()
    }
    
//    func updateSensor(_ req: Request) throws -> Future<Sensor> {
//        return try flatMap(to: Sensor.self, req.parameters.next(Sensor.self), req.content.decode(Sensor.self)) { (sensor, updatedSensor) in
//            sensor.value = updatedSensor.value
//            return sensor.save(on: req)
//        }
//    }
//
//    func deleteSensor(_ req: Request) throws -> Future<HTTPStatus> {
//        return try req.parameters.next(Sensor.self).flatMap { (sensor) in
//            return sensor.delete(on: req).transform(to: HTTPStatus.noContent)
//        }
//    }
    
    func boot(router: Router) throws {
        let sensorRoute = router.grouped("api", "sensors")
        sensorRoute.get("getAlls", use: getAllSensors)
        sensorRoute.post("creatNew", use: creatNewSensor)
//        sensorRoute.put("update", Sensor.parameter, use: updateSensor)
//        sensorRoute.delete("delete", Sensor.parameter, use: deleteSensor)
    }
}
