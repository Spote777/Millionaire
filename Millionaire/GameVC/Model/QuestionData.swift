//
//  QuestionData.swift
//  Millionaire
//
//  Created by Павел Заруцков on 24.02.2021.
//

import Foundation

class QuestionData {

    class func loadQuestions() -> [Question] {
        return [
            Question(text: "Какой газ преобладает в атмосфере Земли?", variants: [
                Answer.A: Variant(text: "Кислород", isRight: false),
                Answer.B: Variant(text: "Углекислый газ", isRight: false),
                Answer.C: Variant(text: "Водород", isRight: false),
                Answer.D: Variant(text: "Азот", isRight: true),
            ]),
            Question(text: "Кто из этих деятелей искусства стал директором первого профессионального публичного театра России??", variants: [
                Answer.A: Variant(text: "Василий Каратыгин", isRight: false),
                Answer.B: Variant(text: "Александр Сумароков", isRight: true),
                Answer.C: Variant(text: "Павел Молчанов", isRight: false),
                Answer.D: Variant(text: "Яков Княжнин", isRight: false),
            ]),
            Question(text: "Что является характеристикой коллекционного вина", variants: [
                Answer.A: Variant(text: "Стойкость", isRight: false),
                Answer.B: Variant(text: "Выносливость", isRight: false),
                Answer.C: Variant(text: "Выдержка", isRight: true),
                Answer.D: Variant(text: "Трезвость", isRight: false),
            ]),
            Question(text: "Морской путь в какую страну искала экспедиция Колумба, доплыв вместо этого до Америки?", variants: [
                Answer.A: Variant(text: "Индия", isRight: true),
                Answer.B: Variant(text: "Эфиопия", isRight: false),
                Answer.C: Variant(text: "Япония", isRight: false),
                Answer.D: Variant(text: "Китай", isRight: false),
            ])
        ]
    }
}
