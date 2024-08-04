//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    // MARK: - Public Properties
    var result: [Answer]!

    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getAnimal()
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
private extension ResultViewController {
     func getAnimal() {
         let animals = result.map { $0.animal }
         let animalCounts = Dictionary(animals.map { ($0, 1) }, uniquingKeysWith: +)

         if let topAnimal = animalCounts.max(by: { $0.value < $1.value })?.key {
             updateUI(with: topAnimal)
         }
    }
    
     func updateUI(with topAnimal: Animal) {
        animalLabel.text = "Вы - \(topAnimal.rawValue)!"
        definitionLabel.text = topAnimal.definition
    }
}
