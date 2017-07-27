//
//  main.swift
//  IPConvertor
//
//  Created by zengdaqian on 2017/7/27.
//  Copyright © 2017年 zengdaqian. All rights reserved.
//

import Foundation


let ips = ["172.168.5.1", "172 . 168.5.1", "1 72.168.5.1"]

do {
    for ip in ips {
        let iip = try Convertor.convert(ip: ip)
        print("\(ip) is \(iip)")
    }
} catch {
    print("ip \(error)")
}

