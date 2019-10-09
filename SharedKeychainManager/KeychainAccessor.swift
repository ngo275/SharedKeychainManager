//
//  KeychainAccessor.swift
//  SharedKeychainManager
//
//  Created by ShuichiNagao on 2019/10/09.
//  Copyright © 2019 Shuichi Nagao. All rights reserved.
//

import Foundation
import KeychainAccess

public enum SecretFields: String {
    // NOTE: if you add a new value, please add it to `removeAll`
    // NOTE: you have to check `KeyManagementRepository.hasSession` as well.
    case pincode, mnemonic, account, publicKeys, accessToken
}

public struct KeychainAccessor {
    private static var SERVICE_NAME = "secrets.tech.shuichi"
    private static let keychain = Keychain(service: SERVICE_NAME).synchronizable(true)
        .accessibility(.afterFirstUnlock)
    
    public static func setup(suiteName: String = "") {
        if suiteName.isEmpty {
            // break
        } else {
            SERVICE_NAME = "\(suiteName).\(SERVICE_NAME)"
        }
    }
    
    /// Saves string value
    static func save(field: SecretFields, value: String) {
        keychain[field.rawValue] = value
    }
    
    /// Saves data
    static func save(field: SecretFields, value: Data) throws {
        try keychain.set(value, key: field.rawValue)
    }
    
    /// Removes a value from Keychain
    static func remove(field: SecretFields) {
        keychain[field.rawValue] = nil
    }
    
    /// Removes all information in KeyChain
    static func removeAll() {
        keychain[SecretFields.pincode.rawValue] = nil
        keychain[SecretFields.mnemonic.rawValue] = nil
        keychain[SecretFields.account.rawValue] = nil
        keychain[SecretFields.publicKeys.rawValue] = nil
        keychain[SecretFields.accessToken.rawValue] = nil
    }
    
    /// Retrieves string value from Keychain
    static func get(field: SecretFields) -> String? {
        return try? keychain.get(field.rawValue)
    }
    
    /// Retrieves data value from Keychain
    static func getData(field: SecretFields) -> Data? {
        return try? keychain.getData(field.rawValue)
    }
}
