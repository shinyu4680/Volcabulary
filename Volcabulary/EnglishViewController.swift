//
//  EnglishViewController.swift
//  Volcabulary
//
//  Created by kevin on 2018/6/15.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class EnglishViewController: UIViewController {

    @IBOutlet weak var vocLabel: UILabel!
    @IBOutlet weak var sentenceTextView: UITextView!
    
    var alphabet = ""
    var vocDetail = [String]()
    var vocabularys = [String]()
    var vocIndex = 0
    
    
    func show () {
        let vocabulary = vocabularys[vocIndex]
        vocDetail = vocabulary.components(separatedBy: "\t")
        
        vocLabel.text = vocDetail[0]
        self.sentenceTextView.text = vocDetail[2]
    }
    
    @IBAction func nextBtnPressed (_ sender: Any) {
        vocIndex += 1
        if vocIndex > vocabularys.count - 1{
            vocIndex = 0
        }
        
        show()
    }
    
    @IBAction func forwardBtnPressed (_ sender: Any) {
        vocIndex -= 1
        if vocIndex < 0 {
            vocIndex = vocabularys.count - 1
        }
        
        show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = alphabet
        
        let path = Bundle.main.path(forResource: alphabet, ofType: "txt")
        let content = try! String(contentsOfFile: path!, encoding: String.Encoding.utf16)
        vocabularys = content.components(separatedBy: "\n")
        
        show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func engToChi(_ sender: Any) {
        performSegue(withIdentifier: "EngToChiSegue", sender: sender)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let navController = segue.destination as! UINavigationController
        let chiController = navController.topViewController as! ChineseViewController
        
        chiController.vocabulary = vocDetail[1]
        chiController.sentence = vocDetail[3]
        chiController.alphabet = alphabet
    }
   

}
