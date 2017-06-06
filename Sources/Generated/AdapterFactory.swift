import Foundation
import Configuration
import CloudFoundryConfig
import CouchDB

public class AdapterFactory {
    let manager: ConfigurationManager

    init(manager: ConfigurationManager) {
        self.manager = manager
    }

    public func getServerMealAdapter() throws -> ServerMealAdapter {
      let service = try manager.getCloudantService(name: "crudDataStore")
      return ServerMealCloudantAdapter(ConnectionProperties(
          host:     service.host,
          port:     Int16(service.port),
          secured:  service.secured,
          username: service.username,
          password: service.password
      ))
    }

}
