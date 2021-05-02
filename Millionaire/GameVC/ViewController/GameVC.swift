//
//  GameVC.swift
//  Millionaire
//
//  Created by Павел Заруцков on 20.02.2021.
//

import UIKit

protocol GameVCDelegate: class {
    func didEndGame(_ result: GameResults)
}

class GameVC: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var firstVarLbl: UIButton!
    @IBOutlet weak var secondVarLbl: UIButton!
    @IBOutlet weak var thirdVarLbl: UIButton!
    @IBOutlet weak var fourthVarLbl: UIButton!
    @IBOutlet weak var score: UILabel!
    
    weak var delegate: GameVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Game.shared.newGame()
        guard let viewModel = Game.shared.getQuestionViewModel() else { return }
        
        renderScreen(viewModel: viewModel)
        
    }
    
    @IBAction func exit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
 
    
    @IBAction func firstVarBtn(_ sender: UIButton) {
        handleVariant(answer: Answer.A)
    }
    
    @IBAction func secondVarBtn(_ sender: UIButton) {
        handleVariant(answer: Answer.B)
    }
    
    @IBAction func thirdVarBtn(_ sender: UIButton) {
        handleVariant(answer: Answer.C)
    }
    
    @IBAction func fourthVarBtn(_ sender: UIButton) {
        handleVariant(answer: Answer.D)
    }

    private func handleVariant(answer: Answer) {
        guard let vm = Game.shared.handleAnswer(answer) else {return}
        renderScreen(viewModel: vm)
    }
    private func renderScreen(viewModel: QuestionModel) {
        
        if viewModel.shouldEndGame {
            print("end game")
            guard let results = Game.shared.finish() else { return }
            
            delegate?.didEndGame(results)
            
            dismiss(animated: true, completion: nil)
            return
        }
        
        guard let q = viewModel.question else { return }
        question.text = q.text
        
        firstVarLbl.setTitle(q.variants[Answer.A]?.text, for: .normal)
        secondVarLbl.setTitle(q.variants[Answer.B]?.text, for: .normal)
        thirdVarLbl.setTitle(q.variants[Answer.C]?.text, for: .normal)
        fourthVarLbl.setTitle(q.variants[Answer.D]?.text, for: .normal)
        
        score.text = "Score: \(viewModel.score)"
    }
}
