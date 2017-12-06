# JWSBoltsSwiftSample
Just Bolts-Swift Sample Source ..
Link: [Bolts-Swift][boltslink]
[boltslink]: https://github.com/BoltsFramework/Bolts-Swift "Go Bolts-Swift"

# Info
## Result Image
![Result Image text](/image/result_image.png "Result View")

## Source
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
