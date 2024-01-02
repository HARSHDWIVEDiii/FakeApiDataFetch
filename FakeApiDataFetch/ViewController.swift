//
//  ViewController.swift
//  FakeApiDataFetch
//
//  Created by Mac on 30/12/23.
//

import UIKit

class ViewController: UIViewController {
    var university : [University] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        detaFetch()
    }

    func detaFetch(){
        let url = URL(string: "https://reqres.in/api/users?page=2")
        var  urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        let urlSesson = URLSession(configuration: .default)
        
        let dataTask = urlSesson.dataTask(with: urlRequest) { data, response, error in
            let urlResponse = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            
            let data = urlResponse["data"] as! [[String:Any]]
            
            for eachUrlResponse in data {
                let urlDictonary = eachUrlResponse  as! [String:Any]
                let id = urlDictonary["id"] as! Int
                let email = urlDictonary["email"] as! String
                let first_name = urlDictonary["first_name"] as! String
                let last_name = urlDictonary["last_name"] as! String
                let avatar = urlDictonary["avatar"] as! String
                
                let object = dates(id: id, email: email, first_name: first_name, last_name: last_name, avatar: avatar)
            let dataObkect = University(data: [object])
                self.university.append(dataObkect)
                print(self.university)
        }
    }
        dataTask.resume()
}

}
