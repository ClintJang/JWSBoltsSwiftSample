# JWSBoltsSwiftSample
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://swift.org) 

## Description

Just [Bolts-Swift](https://github.com/BoltsFramework/Bolts-Swift) Sample Source ..
- It is a sample that executes several tasks and receives notification of the result after all.
- Bolts-Swift Link: https://github.com/BoltsFramework/Bolts-Swift
- Rather than this, you can use "zip" in RxSwift.

# Info
## Result Image

<img width="325" height="667" src="/Image/result_image.png"></img>

## Source
- ViewController.swift
<pre><code>

func runTestTask() {
        var tasks = [Task<AnyObject>]()
        
        tasks.append(SampleTaskManager().sampleTask1())
        tasks.append(SampleTaskManager().sampleTask2())
        //        tasks.append(SampleTaskManager().sampleError1Task())
        tasks.append(SampleTaskManager().sampleITunesTask("909253"))
        tasks.append(SampleTaskManager().sampleITunesTask("284910350"))
        tasks.append(SampleTaskManager().sampleITunesTask("1186189731"))
        tasks.append(SampleTaskManager().sampleLoopTask(1111111))
        tasks.append(SampleTaskManager().sampleLoopTask(1234567))
        tasks.append(SampleTaskManager().sampleLoopTask(12345678))
        
        Task<AnyObject>.whenAllResult(tasks).continueWith { (task) -> String in
            let message = "\n\nAll task Completion!!!!!! \n\ninfo : \(task)"
            print(message)
            
            let alert = UIAlertController(title: "Completion", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return "Completion"
        }
    }

</code></pre>

- SampleManager.swift

<pre><code>

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

</code></pre>

## License

Copyright 2017 Clint Jang.

Licensed under MIT License: https://opensource.org/licenses/MIT
