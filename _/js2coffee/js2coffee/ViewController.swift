    //
//  ViewController.swift
//  js2coffee
//
//  Created by Adam Butler on 24/03/2015.
//  Copyright (c) 2015 Adam Butler. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        code.automaticQuoteSubstitutionEnabled = false
    }

    @IBOutlet var code: NSTextView!
    
    @IBAction func convert(sender: NSButton) {
        let commandOutput = executeCommand("/usr/local/bin/zsh", args: ["/Users/adambutler/js2coffee.sh", code.string!])
        code.string = commandOutput
    }

    
    func executeCommand(command: String, args: [String]) -> String {
        
        let task = NSTask()
        
        task.launchPath = command
        task.arguments = args
        
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: NSUTF8StringEncoding)!
        
        return output
        
    }
}

