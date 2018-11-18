//
//  WorkoutStepMessageKeys.swift
//  FitDataProtocol
//
//  Created by Kevin Hoogheem on 8/18/18.
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

@available(swift 4.2)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
extension WorkoutStepMessage: FitMessageKeys {
    /// CodingKeys for FIT Message Type
    public typealias FitCodingKeys = MessageKeys

    /// FIT Message Keys
    public enum MessageKeys: Int, CodingKey, CaseIterable {
        /// Step Name
        case stepName               = 0
        /// Duration Type
        case durationType           = 1
        /// Duration Value
        case durationValue          = 2
        /// Target Type
        case targetType             = 3
        /// Target Value
        case targetValue            = 4
        /// Custom Target Value Low
        case customTargetValueLow   = 5
        /// Custom Target Value Hight
        case customTargetValueHigh  = 6
        /// Intensity
        case intensity              = 7
        /// Notes
        case notes                  = 8
        /// Equipment
        case equipment              = 9
        /// Categroy
        case category               = 10

        /// Message Index
        case messageIndex           = 254
    }
}

public extension WorkoutStepMessage.FitCodingKeys {

    /// Key Base Type
    public var baseType: BaseType {
        switch self {
        case .stepName:
            return .string
        case .durationType:
            return .enumtype
        case .durationValue:
            return .uint32
        case .targetType:
            return .enumtype
        case .targetValue:
            return .uint32
        case .customTargetValueLow:
            return .uint32
        case .customTargetValueHigh:
            return .uint32
        case .intensity:
            return .enumtype
        case .notes:
            return .string  //50
        case .equipment:
            return .enumtype
        case .category:
            return .uint16
        case .messageIndex:
            return .uint16
        }
    }

}
