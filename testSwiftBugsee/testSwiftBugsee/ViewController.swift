//
//  ViewController.swift
//  testSwiftBugsee
//
//  Created by Alex Severyanov on 12/22/16.
//  Copyright © 2016 alexizh. All rights reserved.
//

import UIKit
import XCGLogger
import SwiftyBeaver
import CocoaLumberjack

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		NSLog("My awersome LOGS")//ios 10+ - os/log, before - asl. It is displayd in device console also
		print("awesome logs with pring")
		
		XCGLogger.setup()
		XCGLogger.default.logln("XCGLogger log")//same as print
		
		DDLog.add(DDTTYLogger.sharedInstance()) // TTY = Xcode console
		DDLogDebug("DDLOG DEBUG ONLY CONSOLE");//writev(STDERR_FILENO)
		DDLog.add(DDASLLogger.sharedInstance())
		DDLogDebug("DDLOG DEBUG WITH ASL");//asl, It is displayd in device console also
		
		SwiftyBeaver.addDestination(ConsoleDestination())
		SwiftyBeaver.debug("SwiftyBeaver logger")//just print or nslog
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

