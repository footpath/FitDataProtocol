//
//  KeyedFieldDefintionProtocol.swift
//  FitDataProtocol
//
//  Created by Kevin Hoogheem on 4/20/19.
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

/// Protocol for Creating Field Definition Message from FitMessage keys
///
/// This is typically added to the FitCodingKeys for a Message
internal protocol KeyedFieldDefintion {
    /// Create a Field Definition Message From the Key
    ///
    /// - Parameter size: Data Size, if nil will use the keys predefined size
    /// - Returns: FieldDefinition
    func fieldDefinition(size: UInt8) -> FieldDefinition
    
    /// Create a Field Definition Message From the Key
    ///
    /// - Returns: FieldDefinition
    func fieldDefinition() -> FieldDefinition
    
    /// Raw Value for CodingKey
    var keyRawValue: Int { get }
}

extension KeyedFieldDefintion where Self: BaseTypeable {
    
    /// Create a Field Definition Message From the Key
    ///
    /// - Parameter size: Data Size, if nil will use the keys predefined size
    /// - Returns: FieldDefinition
    internal func fieldDefinition(size: UInt8) -> FieldDefinition {
        
        let fieldDefinition = FieldDefinition(fieldDefinitionNumber: UInt8(self.keyRawValue),
                                              size: size,
                                              endianAbility: self.baseData.type.hasEndian,
                                              baseType: self.baseData.type)
        
        return fieldDefinition
    }
    
    /// Create a Field Definition Message From the Key
    ///
    /// - Returns: FieldDefinition
    internal func fieldDefinition() -> FieldDefinition {
        
        let fieldDefinition = FieldDefinition(fieldDefinitionNumber: UInt8(self.keyRawValue),
                                              size: self.baseData.type.dataSize,
                                              endianAbility: self.baseData.type.hasEndian,
                                              baseType: self.baseData.type)
        
        return fieldDefinition
    }

}