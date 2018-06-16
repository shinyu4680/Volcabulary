//
//  FavDetailViewController.swift
//  Volcabulary
//
//  Created by kevin on 2018/6/16.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class FavDetailViewController: UIViewController {

    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var engTextView: UITextView!
    @IBOutlet weak var chiLabel: UILabel!
    @IBOutlet weak var chiTextView: UITextView!
    
    var voc: VocabularyFav!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        engLabel.text = voc.engTitle
        engTextView.text = voc.engSentence
        chiLabel.text = voc.chiTitle
        chiTextView.text = voc.chiSentence
        self.navigationItem.title = voc.engTitle
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
