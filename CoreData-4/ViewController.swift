//
//  ViewController.swift
//  CoreData-4
//
//  Created by NTS on 17/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textCompany: UITextField!
    @IBOutlet weak var textModel: UITextField!
    @IBOutlet weak var textPrice: UITextField!
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


    @IBAction func seeDataButtonPressed(_ sender: UIButton) {
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let dictionaryOfData = ["company": textCompany.text!, "model": textModel.text!, "price": textPrice.text!]
        DatabaseHelper.databaseObject.addDataToCoreData(obj: dictionaryOfData)
        
        for textField in textFields {
            textField.text = ""
        }
    }
}

