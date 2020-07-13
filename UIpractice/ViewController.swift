//
//  ViewController.swift
//  UIpractice
//
//  Created by Yuya Harada on 2020/07/14.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // size
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height * 2)
        view.addSubview(webView)
        
        //load the page
        webView.navigationDelegate = self
        let url = URL(string: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    
    //start loading
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("start loading")
        indicator.startAnimating()
    }
    
    //finish loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("end loading")
        indicator.stopAnimating()
    }

    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
}

