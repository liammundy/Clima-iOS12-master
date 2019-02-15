//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
     func tempInC(data: Int)
    func isInC(result: Bool)
}


class ChangeCityViewController: UIViewController {
    
    //Declare the delegate variable here:
    var delegate : ChangeCityDelegate?
    var data : Int = 0
    //var data = ""
    var isInC = true
    var tempInC : Int = 0
    @IBOutlet weak var tempswitch: UISwitch!
    
    @IBAction func tempswitch(_ sender: Any) {
        if isInC == true {
        isInC = false
        tempInC = ((data)*9/5)+32
        print(data)
        print(tempInC)
        } else {
            isInC = true 
        }
    }
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!

    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        
        
        //1 Get the city name the user entered in the text field
        let cityName = changeCityTextField.text!
        
        //2 If we have a delegate set, call the method userEnteredANewCityName
        delegate?.userEnteredANewCityName(city: cityName)
        
        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        delegate?.tempInC(data: tempInC)
        delegate?.isInC(result: isInC)
    }
    
}
