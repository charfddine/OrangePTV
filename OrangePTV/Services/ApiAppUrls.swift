//
//  ApiAppUrls.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation

let apiUrl = "https://api.ocs.fr"
let apiImageUrl = "https://statics.ocs.fr"
let apiUrlImg = "https://api.ocs.fr/apps/v2"
let searchUrl = apiUrl + "/apps/v2/contents?search=title%3D"
enum AppError: Error {
    case invalidUrl
    case invalidData
}
