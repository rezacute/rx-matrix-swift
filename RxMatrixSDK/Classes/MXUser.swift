//
//  MXUser.swift
//
//  Copyright (c) 2017 rezacute <rezaqt@gmail.com>
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

public enum UserAuthenticationStatus {
    case NOT_LOGGED, LOGGED, LOGGING
}

public struct MXCredential {
    public let username : String
    public let homeserver : String
    public fileprivate(set) var accessToken : String? = nil

    public var mxValidUsername : String {
        return "@" + self.username + ":" + self.homeserver
    }

    public init(homeserver: String,username:String){
        self.homeserver = homeserver
        self.username = username
    }
}

/// Represent Matrix User
open class MXUser: NSObject {

    // Can't init is singleton
    fileprivate override init() { }

    public static let currentUser = MXUser()

    /// current user authentication status.
    public fileprivate(set) var status : UserAuthenticationStatus = .NOT_LOGGED

    private var credential : MXCredential?

    /// Responsible for authenticating
    public static func authenticate(credential: MXCredential, password : String? = nil, _ completion : @escaping ((Error?)->())){
        //TODO: error handling

        let parameters = [
            "type":"m.login.password",
            "user":credential.mxValidUsername,
            "password":password!
        ]

        let endpoint: String = "https://" + credential.homeserver + ":8448/_matrix/client/r0/login"
        Alamofire.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in

                if let json = response.result.value as? [String: Any] {
                    let accessToken = json["access_token"]
                    debugPrint(accessToken!)
                    var updatedCredential = credential
                    updatedCredential.accessToken = accessToken as! String?
                    MXCurrentUser.status = .LOGGED
                    MXCurrentUser.credential = updatedCredential
                }
                completion(response.error)
        }
    }

}

public let MXCurrentUser = MXUser.currentUser
