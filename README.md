# JWSBoltsSwiftSample
## Description
Just Bolts-Swift Sample Source ..
- It is a sample that executes several tasks and receives notification of the result after all.
- Bolts-Swift Link: https://github.com/BoltsFramework/Bolts-Swift

# Info
## Result Image

<img width="325" height="667" src="/Image/result_image.png"></img>

## Source
- ViewController
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
