import Foundation
import ParseSwift

struct Workout: ParseObject {
    var originalData: Data?
    
    // Essential ParseObject properties
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    
    // Workout-specific fields
    var title: String?
    var date: Date?
    var type: String?
    var duration: Int? // Duration in minutes
    var sets: Int?
    var repetitions: Int?
    var description: String?
    var user: User? // Relation to the User who logged the workout
}

