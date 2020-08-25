//
//  Logger.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

class Logger {
    
    static let shared = Logger()
    
    public init() {
        //Empty Init
    }
    
    static func logRequest(request: URLRequest) {
        var requestDebugLog = "==REQUEST===============================================\n"
        requestDebugLog += "🎯🎯🎯 URL: \(request.url?.absoluteString ?? "")\n"
        requestDebugLog += "-----------------------------------------------------------\n"
        requestDebugLog += "⚒⚒⚒ HTTP METHOD: \(request.httpMethod ?? "")\n"
        requestDebugLog += "-----------------------------------------------------------\n"
        requestDebugLog += "📝📝📝 HEADERS: \(request.allHTTPHeaderFields ?? [:])\n"
        requestDebugLog += "-----------------------------------------------------------\n"
        print(requestDebugLog)
    }
    
    static func logResponse(_ response: URLResponse?,_ data: Data?) {
        var responseDebugLog = "==RESPONSE==============================================\n"
        responseDebugLog += "⚠️⚠️⚠️ STATUS CODE: \((response as? HTTPURLResponse)?.statusCode ?? -1)\n"
        responseDebugLog += "-----------------------------------------------------------\n"
        responseDebugLog += "📒📒📒 HEADERS: \((response as? HTTPURLResponse)?.allHeaderFields as? [String: String] ?? [:])\n"
        responseDebugLog += "-----------------------------------------------------------\n"
        
        if let dataObj = data {
            do {
                let json = try JSONSerialization.jsonObject(with: dataObj, options: .mutableContainers)
                let prettyPrintedData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                responseDebugLog += "⬇️⬇️⬇️ RESPONSE DATA: \n\(String(bytes: prettyPrintedData, encoding: .utf8) ?? "")"
            } catch {
                responseDebugLog += "⬇️⬇️⬇️ RESPONSE DATA: \n\(String(data: dataObj, encoding: .utf8) ?? "")"
            }
            responseDebugLog += "\n"
        }
        responseDebugLog += "===========================================================\n"
        
        print(responseDebugLog)
    }
}

