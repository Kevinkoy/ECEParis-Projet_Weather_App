//
//  TableViewController.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 20/03/2021.
//

import Foundation
import UIKit
import Alamofire // IMPORTANT /!\ install Cocoapods to import Alamofire

class TableViewController: UITableViewController{
    //my Binding
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Appel de l'API
        callAPI()
    }
    
    
    
    // Properties
    //let url : String = OpenWeatherMap().getURL()
    //var responseArray = [WeatherModel]()
    let URL2 = "https://jsonplaceholder.typicode.com/posts"
    var responseArray = [DataModel]()
    

    // my Functions
    func callAPI()
    {
        Alamofire.request(URL(string: URL2)!, method: .get, parameters: nil, headers: nil).responseJSON{ (response) in
            if let responseData = response.data {
                do {
                    // Déclaration et Initialisation du Décodeur JSON
                    let decodeJson = JSONDecoder()
                    //decodeJson.keyDecodingStrategy = .convertFromSnakeCase
                    
                    // self c'est TableViewController. on ESSAYE de décoder
                    self.responseArray = try decodeJson.decode([DataModel].self, from: responseData)

                    // Recharger les données de TableViewController.tableView
                    self.tableView.reloadData()
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension TableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = "Hello"
        //cell.detailTextLabel?.text = "Yo"
        cell.textLabel?.text = String(responseArray[indexPath.row].id ?? 0)
        cell.detailTextLabel?.text = responseArray[indexPath.row].title
        return cell
    }
}




