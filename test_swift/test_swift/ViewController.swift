//
//  ViewController.swift
//  test_swift
//
//  Created by mx1614 on 1/23/19.
//  Copyright © 2019 ludy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("hello world");
        view.layer?.backgroundColor = NSColor.red.cgColor
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

