//
//  DetailViewController.swift
//  CoreData-4
//
//  Created by NTS on 17/01/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var mobileArray = [Mobile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileArray = DatabaseHelper.databaseObject.getDataFromCoreData()!
    }
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell") as? DetailTableViewCell
        cell?.companyLabel.text = mobileArray[indexPath.row].company
        cell?.modelLabel.text = mobileArray[indexPath.row].model
        cell?.priceLabel.text = mobileArray[indexPath.row].price
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mobileArray = DatabaseHelper.databaseObject.deleteDataFromCoreData(index: indexPath.row)!
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
