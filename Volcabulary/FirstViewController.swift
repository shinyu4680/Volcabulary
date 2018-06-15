//
//  FirstViewController.swift
//  Volcabulary
//
//  Created by kevin on 2018/6/15.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let button = sender as! UIButton
        let controller = segue.destination as! EnglishViewController
        
        controller.alphabet = button.currentTitle!
    }
    
    @IBAction func alphabetBtnPressed (_ sender: UIButton) {
        performSegue(withIdentifier: "DetailSegue", sender: sender)
    }

}

