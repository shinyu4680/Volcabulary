//
//  FavTableViewController.swift
//  Volcabulary
//
//  Created by kevin on 2018/6/16.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class FavTableViewController: UITableViewController {

    var currentVoc: VocabularyFav!
    var vocabularyFavs = [VocabularyFav]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let vocabularyFavs = VocabularyFav.readFromFile() {
            self.vocabularyFavs = vocabularyFavs
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: 更新畫面
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let vocabularyFavs = VocabularyFav.readFromFile() {
            self.vocabularyFavs = vocabularyFavs
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabularyFavs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell", for: indexPath) as? FavTableViewCell else {
            fatalError("Could not dequeue a cell")
        }

        // Configure the cell...
        currentVoc = vocabularyFavs[indexPath.row]
        cell.titleLabel.text = currentVoc.engTitle
        cell.detailLabel.text = currentVoc.chiTitle

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        vocabularyFavs.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        VocabularyFav.saveToFile(vocabularyFavs: vocabularyFavs)
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let element = vocabularyFavs.remove(at: fromIndexPath.row)
        vocabularyFavs.insert(element, at: to.row)
        
        VocabularyFav.saveToFile(vocabularyFavs: vocabularyFavs)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as? FavDetailViewController
        
        if let row = tableView.indexPathForSelectedRow?.row {
            controller?.voc = vocabularyFavs[row]
        }
    }
    

}
