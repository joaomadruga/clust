//
//  ListOfGroupsModel.swift
//  clust
//
//  Created by João Madruga on 25/04/23.
//

import Foundation
import Swift

class GroupModel: NSObject, NSSecureCoding {
    var members: [QuizUserModel]

    init(members: [QuizUserModel]) {
        self.members = members
    }
    
    static var supportsSecureCoding: Bool {
       return true
    }

    required convenience init?(coder decoder: NSCoder) {
        guard let membersData = decoder.decodeObject(forKey: "members") as? Data,
              let members = try? NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: QuizUserModel.self, from: membersData)
        else {
            return nil
        }
            self.init(members: members)
    }

    func encode(with encoder: NSCoder) {
        let membersData = try? NSKeyedArchiver.archivedData(withRootObject: members, requiringSecureCoding: true)
        encoder.encode(membersData, forKey: "members")
    }
}
