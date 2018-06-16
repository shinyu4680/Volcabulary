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
    
    // MARK: - Property
    var alphabet = ""
    var vocDetail = [String]()
    var vocabularys = [String]()
    var vocIndex = 0
    
    var currentVoc: VocabularyFav!
    var vocabularyFavs = [VocabularyFav]()
    
    
    // MARK: 讀取個別單字並顯示於畫面上
    func show () {
        let vocabulary = vocabularys[vocIndex]
        vocDetail = vocabulary.components(separatedBy: "\t")
        
        vocLabel.text = vocDetail[0]
        self.sentenceTextView.text = vocDetail[2]
        
    }
    
    // MARK: 下一個/前一個 單字
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
    
    // MARK: 抓取正在顯示的單字, 存入本機資料
    @IBAction func favoriteBtnPressed (_ sender: Any) {
        currentVoc = VocabularyFav(engTitle: vocDetail[0], chiTitle: vocDetail[1], engSentence: vocDetail[2], chiSentence: vocDetail[3])
        
        vocabularyFavs.insert(currentVoc!, at: 0)
        VocabularyFav.saveToFile(vocabularyFavs: vocabularyFavs)
        
        saveToFileAlert()
    }
    
    func saveToFileAlert () {
        let controller = UIAlertController(title: "Save scessfully!", message: "Go check your favorite list", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
    
    // MARK: 讀取txt檔案內容, 抓取本機資料
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = alphabet
        
        let path = Bundle.main.path(forResource: alphabet, ofType: "txt")
        let content = try! String(contentsOfFile: path!, encoding: String.Encoding.utf16)
        vocabularys = content.components(separatedBy: "\n")
        
        show()
        
        if let vocabularyFavs = VocabularyFav.readFromFile() {
            self.vocabularyFavs = vocabularyFavs
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    @IBAction func engToChi(_ sender: Any) {
        performSegue(withIdentifier: "EngToChiSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navController = segue.destination as! UINavigationController
        let chiController = navController.topViewController as! ChineseViewController
        
        chiController.vocabulary = vocDetail[1]
        chiController.sentence = vocDetail[3]
        chiController.navTitle = vocDetail[0]
    }
   

}
