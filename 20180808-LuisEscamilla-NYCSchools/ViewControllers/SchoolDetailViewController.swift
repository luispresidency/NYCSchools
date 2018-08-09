//
//  SchoolDetailViewController.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import UIKit

class SchoolDetailViewController: UIViewController {

    var schoolViewModel : SchoolViewModel? = nil
    private var schoolScoresViewModel : SchoolScoresViewModel!
    @IBOutlet weak var detailsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }

    private func updateUI() {
        
        self.schoolScoresViewModel = SchoolScoresViewModel()
        self.title = schoolScoresViewModel.title
        
        Webservice().loadScores(url: Constants.schoolsScoresURL) { [unowned self] (schoolsScores, error) in
            if let schoolsScores = schoolsScores {
                if let schoolSchores = schoolsScores[(self.schoolViewModel?.dbn)!]{
                    self.schoolScoresViewModel.createViewModel(schoolScores: schoolSchores)
                }else{
                    // School scores werent found
                    self.showErrorAlert()
                }
            }else{
                // It would be a better practice to check if there are errors and handle them
                self.showErrorAlert()
            }
        }
        
        // setting up the bindings
        self.schoolScoresViewModel.bindToSchoolViewModels = { [unowned self] in
            // Update label
            self.detailsLbl.text = self.schoolScoresViewModel.schoolScores
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showErrorAlert(){
        // This method should receive a string as parameter to show as a message
        let alert = UIAlertController(title: "NYC Schools", message: "We coudn't find the scores for this school.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [unowned self] action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true)
    }
    
}
