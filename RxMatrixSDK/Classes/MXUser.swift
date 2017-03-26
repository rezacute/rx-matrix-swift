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

public enum UserAuthenticationStatus {
    case NOT_LOGGED, LOGGED, LOGGING
}

public struct MXCredential {
    public let username : String
    public let homeserver : String
    public fileprivate(set) var accessToken : String? = nil

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

    /// Responsible for authenticating
    public static func authenticate(credential: MXCredential, password : String? = nil, _ completion : ((Error?)->())){
        //TODO: implementation
    }

}

public let MXCurrentUser = MXUser.currentUser
