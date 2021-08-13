//
//  InfoVC.swift
//  BulsEye
//
//  Created by Ahmed Awaga on 6/8/21.
//

import UIKit
import WebKit
class InfoVC: UIViewController {
    
    //Mark: -Outlet
     
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHtmlfile()

    }
    //Mark: - Ibaction
    
    @IBAction func closebtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //Mark: -Helperfunction
    
    func loadHtmlfile(){
        
        guard   let HtmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") else {return}
        let HtmlURL = URL(fileURLWithPath: HtmlPath)
        let HtmlURLrequest = URLRequest(url: HtmlURL)
        webview.load(HtmlURLrequest)
    }

}
