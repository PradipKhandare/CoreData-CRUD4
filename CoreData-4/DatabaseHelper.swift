//
//  DatabaseHelper.swift
//  CoreData-4
//
//  Created by NTS on 17/01/24.
//

import Foundation
import UIKit
import CoreData
class DatabaseHelper
{
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var databaseObject = DatabaseHelper()
    
    
    //MARK: - addDataToCoreData
    func addDataToCoreData(obj: [String: String]){
        let mobileData = NSEntityDescription.insertNewObject(forEntityName: "Mobile", into: context!) as! Mobile
        mobileData.company = obj["company"]
        mobileData.model = obj["model"]
        mobileData.price = obj["price"]
        
        do{
            try context?.save()
        }catch {
            print("Data not saved successfully.")
        }
    }
    
    //MARK: - getDataFromCoreData
    func getDataFromCoreData() -> [Mobile]? {
        var mobileInfo = [Mobile]()
        let request = NSFetchRequest<NSManagedObject>(entityName: "Mobile")
        
        do{
            mobileInfo = try context?.fetch(request) as! [Mobile]
            return mobileInfo
        } catch {
            print("Data not found to display.")
            return nil
        }
    }
    
    
    //MARK: - deleteDataFromCoreData
    func deleteDataFromCoreData(index: Int) -> [Mobile]?{
        var mobile = getDataFromCoreData()
        context?.delete(mobile![index])
        mobile?.remove(at: index)
        do{
            try context?.save()
            return mobile
        }catch {
            print("Data not deleted. Something wrong is there")
            return nil
        }
    }
}
