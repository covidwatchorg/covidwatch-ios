//
//  Environment.swift
//  CovidWatch iOS
//
//  Created by Madhava Jay on 16/4/20.
//  
//

import Foundation

enum AppScheme {
    case production
    case development
    case test
}

func getLocalIP() -> String {
    // sometimes the xcode ip sniff fails, in that case you can just
    // hard code it during development
    //return "192.168.176.132"
    if let localIP = Bundle.main.infoDictionary?["LocalIP"] as? String {
        return localIP
    }
    return "localhost"
}

func getLocalFirebaseHost() -> String {
    let firebasePort = 8080
    return "\(getLocalIP()):\(firebasePort)"
}

func getAPIUrl(_ scheme: AppScheme) -> String {
    func getLocalURL() -> String {
        let localProtocol = "http://"
        let localPort = 5001
        let projectSlug = "tagstwo-431e3/us-central1"
        return "\(localProtocol)\(getLocalIP()):\(localPort)/\(projectSlug)"
    }

    switch scheme {
    case .production:
        return "https://us-central1-tagstwo-431e3.cloudfunctions.net"
    default:
        return getLocalURL()
    }
}

func getAppScheme() -> AppScheme {
    if let schemeName = Bundle.main.infoDictionary?["SchemeName"] as? String {
        print("Scheme Name: \(schemeName)")
        switch schemeName {
        case "covidwatch-ios-prod":
            return .production
        case "covidwatch-ios-test":
            return .test
        default:
            return .development
        }
    }
    return .development
}
