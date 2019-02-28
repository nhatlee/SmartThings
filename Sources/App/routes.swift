import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let usersController = SensorController()
    try usersController.boot(router: router)
    
    router.get("redis") { req -> Future<String> in
        return req.withNewConnection(to: .redis) { redis in
            return redis.command("INFO")
                // map the resulting RedisData to a String
                .map { $0.string ?? "" }
        }
    }
}
