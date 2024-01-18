//
//  ViewController.swift
//  CoreData-4
//
//  Created by NTS on 17/01/24.
//

import UIKit

class ViewController: UIViewController, AddData {
    
    @IBOutlet weak var textCompany: UITextField!
    @IBOutlet weak var textModel: UITextField!
    @IBOutlet weak var textPrice: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func seeDataButtonPressed(_ sender: UIButton) {
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        detailVC?.delegate = self
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let dictionaryOfData = ["company": textCompany.text!, "model": textModel.text!, "price": textPrice.text!]
        
        if isUpdate == true {
            DatabaseHelper.databaseObject.updateDatainCoreData(object: dictionaryOfData, i: i)
        }else {
            DatabaseHelper.databaseObject.addDataToCoreData(obj: dictionaryOfData)
        }
        
        
        for textField in textFields {
            textField.text = ""
        }
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        textCompany.text = object["company"]
        textModel.text = object["model"]
        textPrice.text = object["price"]
        i = index
        isUpdate = isEdit
    }
    
}

