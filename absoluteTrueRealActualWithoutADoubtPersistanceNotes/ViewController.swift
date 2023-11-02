//
//  ViewController.swift
//  absoluteTrueRealActualWithoutADoubtPersistanceNotes
//
//  Created by ALVIN CHEN on 10/30/23.
//
public struct Dog: Codable{
    var color : String
    var name : String
    var age : Int
    
    
}

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var number = -1
    var d1 : Dog?
    var dogs = [Dog]()
    override func viewDidLoad() {
        super.viewDidLoad()
        number = defaults.integer(forKey: "theNumber")
        print(number)
        //We are decoding a JSON to an object
        if let items = defaults.data(forKey: "theDog") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Dog].self, from: items) {
                dogs = decoded
            }
        }
        for a in dogs{
            print(a.name)
        }
     
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        defaults.set(20, forKey: "theNumber")
        
        var blah = Dog(color: "black", name: "cow", age: 47)
        dogs.append(blah)
        var bla = Dog(color: "white", name: "steve", age: 47)
        dogs.append(bla)
        //encoding the object into JSON so it can be saved
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(dogs) {
            defaults.set(encoded, forKey: "theDog")

        }
    }
    
    }
    

