//
//  ViewController.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import UIKit

class SchoolsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var schoolsListViewModel: SchoolsListViewModel!
    private var selectedSchoolViewModel: SchoolViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateUI()
    }
    
    private func updateUI() {
        
        self.schoolsListViewModel = SchoolsListViewModel()
        self.title = schoolsListViewModel.title

        Webservice().loadSchools(url: Constants.schoolsListURL) { [unowned self] (schools, error) in
            if let schools = schools {
                self.schoolsListViewModel.createSchoolsList(schools: schools)
            }else{
                // It would be a better practice to check if there are errors and handle them
                self.showErrorAlert()
            }
        }
        
        // setting up the bindings
        self.schoolsListViewModel.bindToSchoolViewModels = { [unowned self] in
            // Update table view
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SchoolsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsListViewModel.totalSchools()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as! SchoolTableViewCell
        let school = schoolsListViewModel.school(at: indexPath.row)
        cell.schoolViewModel = school
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSchoolViewModel = schoolsListViewModel.school(at: indexPath.row)
        self.performSegue(withIdentifier: "schoolDetail", sender: self)
    }
    
    func showErrorAlert(){
        // This method should receive a string as parameter to show as a message
        let alert = UIAlertController(title: "NYC Schools", message: "There was an error retriving the list of schools.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}

// Segue methods
extension SchoolsViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SchoolDetailViewController {
            destinationVC.schoolViewModel = selectedSchoolViewModel
        }
    }
    
}

