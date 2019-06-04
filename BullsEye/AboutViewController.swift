//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Preston Jarnagin on 6/3/19.
//  Copyright © 2019 Preston Jarnagin. All rights reserved.

import UIKit
import WebKit
class AboutViewController: UIViewController {
  
  @IBOutlet weak var webView: WKWebView!
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    let myURL = URL(string: "https://www.google.com/")
//    let myRequest = URLRequest(url: myURL!)
//    webView.load(myRequest)
//  }
  override func viewDidLoad() {
    super.viewDidLoad()
    let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html")
    let request = URLRequest(url: url!)
    webView.load(request)
  }
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }


  
}


