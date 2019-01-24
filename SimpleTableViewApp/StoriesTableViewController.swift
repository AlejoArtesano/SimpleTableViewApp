//
//  StoriesTableViewController.swift
//  SimpleTableViewApp
//
//  Created by Aleksey Kapranov on 24/01/2019.
//  Copyright © 2019 Alejo_KA. All rights reserved.
//

import UIKit

struct Headline {
    
    var id : Int
    var title : String
    var text : String
    var image : String
    
}

class StoriesTableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, title: "Apple", text: "An apple is a sweet, edible fruit produced by an apple tree (Malus pumila).", image: "Apple"),
        Headline(id: 2, title: "Apricot", text: "An apricot is a fruit, or the tree that bears the fruit, of several species in the genus Prunus (stone fruits).", image: "Apricot"),
        Headline(id: 3, title: "Banana", text: "A banana is an edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.", image: "Banana"),
        Headline(id: 4, title: "Blueberry", text: "Blueberries are perennial flowering plants with blue– or purple–colored berries. They are classified in the section Cyanococcus within the genus Vaccinium.", image: "Blueberry"),
        Headline(id: 5, title: "Cantaloupe", text: "Cantaloupe (muskmelon, mushmelon, rockmelon, sweet melon) or spanspek (South Africa) is a variety of the Cucumis melo species in the Cucurbitaceae family.", image: "Cantaloupe"),
        
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let headline = headlines[indexPath.row]
        cell.textLabel?.text = headline.title
        cell.detailTextLabel?.text = headline.text
        cell.imageView?.image = UIImage(named: headline.image)
        
        return cell
    }
    
    
    // Enabling the edit mode(self.tableView.isEditing = true) causes delete buttons to be visible for all cells
    // Disable the buttons by implementing these methods:
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    // Reordering control to move cells. Elements in the underlying data list are updated.
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.headlines[sourceIndexPath.row]
        headlines.remove(at: sourceIndexPath.row)
        headlines.insert(movedObject, at: destinationIndexPath.row)
    }
    
}
