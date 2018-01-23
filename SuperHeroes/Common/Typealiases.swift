//
//  Typealiases.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ObjectClosure<T> = (_: T) -> (Void)
typealias RequestSuccessBlock = (_ response: JSON?) -> Void
typealias RequestErrorBlock = (_ error: APIError?) -> Void

