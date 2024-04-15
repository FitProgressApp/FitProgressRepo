import ParseSwift
import Foundation

struct User: ParseUser {
    var emailVerified: Bool?
    
    var authData: [String : [String : String]?]?
    
    var originalData: Data?
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?

    var username: String?
    var email: String?
    var password: String?

    // Custom fields
    var name: String?
    var weightGoal: Int?
    var currentWeight: Int?
}
