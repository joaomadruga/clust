//
//  OptionsModel.swift
//  clust
//
//  Created by João Madruga on 17/03/23.
//

import Foundation

struct OptionModel: Hashable {
    let index: Int
    let text: String
    var isChecked: Bool = false
}
