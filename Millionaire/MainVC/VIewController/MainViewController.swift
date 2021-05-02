//
//  MainViewController.swift
//  Millionaire
//
//  Created by Павел Заруцков on 20.02.2021.
//

import UIKit

class MainViewController: UIViewController, GameVCDelegate {
    
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var result: UIButton!
    @IBOutlet weak var addQuestion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customBtn(start)
        customBtn(result)
        customBtn(addQuestion)

    }

    @IBAction func startBtn(_ sender: UIButton) {
    
        performSegue(withIdentifier: "gameVC", sender: nil)

    }
    
    @IBAction func resultBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ResultCell", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "gameVC":
            guard let vc = segue.destination as? GameVC else { return }
            vc.delegate = self
        
        default: break
        }
    }
    
    func didEndGame(_ result: GameResults) {
        
        print("results")
        print(result)
        Game.shared.addResult(result)
        
    }
    
    func customBtn(_ button: UIButton) {
        
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray
        
    }
}

