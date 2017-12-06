//
//  SampleManager.swift
//  JWSBoltsSwiftSample
//
//  Created by Jang Wangsu on 2017. 12. 6..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

import Foundation
import BoltsSwift

struct SampleTaskManager {
    func sampleError1Task()-> Task<AnyObject> {
        let sampleTask = TaskCompletionSource<AnyObject>()
        
        let url = URL(string: "https://sample.com/error")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if let error = error {
                print("\(#function), \(error)")
//                sampleTask.set(error: error)
                sampleTask.set(result: "error StreamError!!(errorTask)" as AnyObject)
            } else {
                print("\(#function), success errorTask")
                sampleTask.set(result: "success errorTask" as AnyObject)
            }
        }).resume()
        
        return sampleTask.task
    }
    
    func sampleTask1() -> Task<AnyObject>{
        let sampleTask = TaskCompletionSource<AnyObject>()
        
        let url = URL(string: "https://yourdatacenterid.qualtrics.com/API/v3/mailinglists/ML_1234567890AbCdE/samples/PL_123456890AbCdE")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if let error = error {
                print("\(#function), \(error)")
                sampleTask.set(error: error)
            } else {
                print("\(#function), success 1")
                sampleTask.set(result: "success1" as AnyObject)
            }
        }).resume()
        
        return sampleTask.task
    }
    
    func sampleTask2() -> Task<AnyObject>{
        let sampleTask = TaskCompletionSource<AnyObject>()
        
        let url = URL(string: "https://itunes.apple.com/lookup?id=909253")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if let error = error {
                print("\(#function), \(error)")
                sampleTask.set(error: error)
            } else {
                print("\(#function), success 2")
                sampleTask.set(result: "success2" as AnyObject)
            }
        }).resume()
        
        return sampleTask.task
    }
    
    func sampleLoopTask(_ loop:Int) -> Task<AnyObject>{
        let sampleTask = TaskCompletionSource<AnyObject>()
        
        DispatchQueue(label: "dataLoop\(loop)").async {
            let loopMax = loop
            for _ in 0..<loopMax {
            }
            print("\(#function), success loop \(loopMax)")
            sampleTask.set(result: "success loop \(loopMax)" as AnyObject)
        }
        
        return sampleTask.task
    }
    
    func sampleITunesTask(_ id:String) -> Task<AnyObject>{
        let sampleTask = TaskCompletionSource<AnyObject>()
        
        let url = URL(string: "https://itunes.apple.com/lookup?id=\(id)")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if let error = error {
                print("\(#function), \(error)")
                sampleTask.set(error: error)
            } else {
                print("\(#function), success id:\(id)")
                sampleTask.set(result: "success id:\(id)" as AnyObject)
            }
        }).resume()
        
        return sampleTask.task
    }
}
