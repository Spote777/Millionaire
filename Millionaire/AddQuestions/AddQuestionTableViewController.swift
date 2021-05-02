//
//  AddQuestionTableViewController.swift
//  Millionaire
//
//  Created by Павел Заруцков on 05.03.2021.
//

import UIKit

enum TextFieldType {
    case question
    case answer
}

protocol AnswerCellUITextFieldChanged {
    func didAnswerTextFieldChanged(questionId: Int, question: String, answer: String)
}

class AddQuestionTableViewController: UITableViewController, AnswerCellUITextFieldChanged {
    var questions: [String] = []
    var rightAnswers: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        layoutAddQuestionUIButton()
        
        for i in Game.shared.getUserQuestionsAnswers() {
            questions.append(i.question)
            rightAnswers.append(i.answer)
        }
    }
    // MARK: - IBOutlets
    @IBOutlet weak var addQuestionUIButton: UIButton!
    
    
    //MARK: - IBActions
    @IBAction func addQuestionPressed(_ sender: UIButton) {
        print("add question pressed")
        questions.append("")
        rightAnswers.append("")
        tableView.reloadData()
    }
    
    @IBAction func buildQuestions(_ sender: UIButton) {
        print("build questions")
        
        Game.shared.saveUserQuestionsAnswers(questions: questions, answers: rightAnswers)
    }
    
    
    //MARK: - Layout
    private func layoutAddQuestionUIButton() {
        addQuestionUIButton.layer.borderWidth = 1
        addQuestionUIButton.layer.borderColor = UIColor.systemBlue.cgColor
        addQuestionUIButton.layer.cornerRadius = 5
    }
    
    //MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddQuestionTableViewCell.cellIdentity) as? AddQuestionTableViewCell else {
            return UITableViewCell()
        }
        
        let question = questions[indexPath.row]
        let answer = rightAnswers[indexPath.row]
        
        cell.questionUITextField.text = question
        cell.rightAnswer.text = answer
        cell.questionId = indexPath.row
        cell.questionFieldsChangled = self
        cell.configureCell()
        return cell
    }
    
    // MARK: - Delegates
    func didAnswerTextFieldChanged(questionId: Int, question: String, answer: String) {
        questions[questionId] = question
        rightAnswers[questionId] = answer
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            questions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
           
        }
    }
}
