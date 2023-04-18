//
//  TeamPassGenerator.swift
//  clust
//
//  Created by José Cordeiro on 16/04/23.
//

/*
import PassKit

func createPass() {
    let pass = PKPass()
    pass.localizedName = "Sua equipe"
    pass.localizedDescription = "Essa é sua equipe"
    pass.organizationName = "Foundations UFPE"
    pass.expirationDate = Date(timeIntervalSinceNow: 60 * 60 * 24 * 7) // Expires in 1 week
    
    let passURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("MyPass.pkpass")
    do {
        try pass.write(to: passURL)
        print("Pass created at \(passURL.absoluteString)")
    } catch {
        print("Error creating pass: \(error.localizedDescription)")
    }
}

 */
 
/**serialNumber: String { get }
 
 open var passTypeIdentifier: String { get }

 open var webServiceURL: URL? { get }

 open var authenticationToken: String? { get }

 
 @NSCopying open var icon: UIImage { get }

 
 open var localizedName: String { get } // e.g. "Boarding Pass"

 open var localizedDescription: String { get } // e.g. "SFO -> LHR"

 open var organizationName: String { get } // e.g. "Great Airways"

 open var relevantDate: Date? { get } // may be useful for sorting*/
