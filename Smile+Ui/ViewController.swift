//
//  ViewController.swift
//  Smile+Ui
//
//  Created by Edgar Sargsyan on 07.07.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [Joke]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let API = "https:v2.jokeapi.dev/joke/Any"
        guard let apiURL = URL(string: API) else {
            fatalError("some Error")
        }

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) {(data, response, error) in
            
            if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data){

//                self.data.append(joke)
//                self.data.append(joke)
                
                print(String(decoding: data, as: UTF8.self))
                self.data.append(joke)

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.tableView.reloadData()

                }
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you taped me ")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.firstLabel?.text = data[indexPath.row].setup
        cell.secondLabel?.text = data[indexPath.row].delivery
        cell.thirdLabel?.text = data[indexPath.row].category

        return cell
    }
}
