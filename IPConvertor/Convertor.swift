//
//  Convertor.swift
//  IPConvertor
//
//  Created by zengdaqian on 2017/7/27.
//  Copyright © 2017年 zengdaqian. All rights reserved.
//

import Foundation

enum ConvertError: Error {
    case invalid
}

extension String {
    var int32: Int32? {
        return Int32(self)
    }
}

struct Convertor {
    
    static func convert(ip: String) throws -> UInt32 {
        
        let params = ip.components(separatedBy: ".")
        guard params.count == 4 else {
            throw ConvertError.invalid
        }
        let p1 = try validate(p: params[0])
        let p2 = try validate(p: params[1])
        let p3 = try validate(p: params[2])
        let p4 = try validate(p: params[3])
        
        var new: UInt32 = 0
        new |= (UInt32(p1) & 0xFF) << 24
        new |= (UInt32(p2) & 0xFF) << 16
        new |= (UInt32(p3) & 0xFF) << 8
        new |= (UInt32(p4) & 0xFF) << 0

        return new
    }
    
    static func validate(p: String) throws -> Int32 {
        guard let t = p.trimmingCharacters(in: .whitespacesAndNewlines).int32 else {
            throw ConvertError.invalid
        }
        return t
    }
    
    
}
