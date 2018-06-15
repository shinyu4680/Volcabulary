//
//  ChineseViewController.swift
//  Volcabulary
//
//  Created by kevin on 2018/6/15.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class ChineseViewController: UIViewController {

    @IBOutlet weak var vocLabel: UILabel!
    @IBOutlet weak var sentenceTextView: UITextView!
    
    var vocabulary = ""
    var sentence = ""
    var alphabet = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vocLabel.text = vocabulary
        self.sentenceTextView.text = sentence
        self.navigationItem.title = alphabet
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func backToEnglish (_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func swipeToForward(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
