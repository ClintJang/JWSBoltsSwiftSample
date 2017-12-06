//
//  ViewController.swift
//  JWSBoltsSwiftSample
//
//  Created by ClintJang on 2017. 12. 6..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

import UIKit
import BoltsSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        runTestTask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
            
            return "완료"
        }
    }
}

