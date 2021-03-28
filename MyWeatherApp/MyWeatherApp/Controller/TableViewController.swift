//
//  File.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 22/03/2021.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation

class TableViewController: UITableViewController {

    //MARK: - Properties
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    //var forecastWeather: ForecastWeather!
    var Array_CollectionView = [ForecastWeather]() // Tableau pour stocker les données de l'API (forecast,q=paris,cnt=8)
    var Array_TableView = [ForecastWeather]() // Tableau pour stocker les données de l'API (forecast, daily?, q=paris)

    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the Datas
        self.getData_For_CollectionView()
        self.getData_For_TableView()
        
    }
    
    //MARK: - getData for Collection View
    func getData_For_CollectionView() {
        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?q=paris&cnt=8&appid=3f05cfb0aa99f7ec370e36e8be48404a").responseJSON { (response) in
            //print(response)
            // Si il y a une réponse...
            let result = response.result
            
            // le résultat de valeur est stocker dans un dictionnaire avec une Key "String" et une Value "anyObject"
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    
                    // On parcourt list
                    for item in list {
                        //On crée un element de type Modele
                        let forecast = ForecastWeather(weatherDict: item)
                        //On ajoute l'élément
                        self.Array_CollectionView.append(forecast)
                    }
                    
                    // On supprime le premier élément du Array_Collection
                    self.Array_CollectionView.remove(at: 0)
                    
                    // On raffraichit les données de la vue de "CollectionView"
                    self.CollectionView.reloadData()
                    
                }
            }

        }
        }
    
    //MARK: - getData for Table View forecast, q=Paris, appid = tkt
    func getData_For_TableView() {
        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast/daily?q=Paris&appid=7c609f73c5df2dff2f32e3e3cc33cd23").responseJSON { (response) in
            //print(response)
            // Si il y a une réponse...
            let result = response.result
            
            // le résultat de valeur est stocker dans un dictionnaire avec une Key "String" et une Value "anyObject"
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    
                    // On parcourt list
                    for item in list {
                        //On crée un element de type Modele
                        let forecast = ForecastWeather(weatherDict: item)
                        //On ajoute l'élément
                        self.Array_TableView.append(forecast)
                    }
                    
                    // On supprime le premier élément du Array_Collection
                    //self.Array_TableView.remove(at: 0)
                    
                    // On a 7 jours avec cette API payante, on en veut 5, on supprimer les 2 derniers jours
                    let lastElement = self.Array_TableView.count-1
                    self.Array_TableView.remove(at: lastElement)
                    self.Array_TableView.remove(at: lastElement-1)
                    
                    // On raffraichit les données de la vue de "TableView"
                    self.tableView.reloadData()
                }
            }
        }
        }
            
    
    //MARK: - Functions for tableView
    
    // NOMBRE DE SECTIONS
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // NOMBRE DE LIGNES
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("jelezlaeaze" + String(Array_TableView.count))
        return Array_TableView.count
    }
    
    // Configure chaque cellule
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        // Design of cells
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        //cell.layer.cornerRadius = 10
        cell.configureCell(forecastData: Array_TableView[indexPath.row])
        return cell
    }

    
    
}


//MARK: - extension for CollectionView

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return Array_CollectionView.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // identifier la CollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        // Design of cells
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10

        // Appeler sa fonction pour configure
        cell.configureCell(forecastData: Array_CollectionView[indexPath.row])
        return cell
}
     
}

