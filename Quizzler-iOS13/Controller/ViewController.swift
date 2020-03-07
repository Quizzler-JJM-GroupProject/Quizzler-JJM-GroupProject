//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.quizQuestions[0].text

        updateUI()

    }

    var timer = Timer()
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(answer: userAnswer)

        if userGotItRight {
            sender.backgroundColor = UIColor.green

        }else{
            sender.backgroundColor = UIColor.red

        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

        var doWeRestart = quizBrain.nextQuestion()

        int nums=0;	//skip the initial value expression
        while(nums<=52)	// condition and/or increment by adding
        {for (z = 0, a = nums; z < a; i++, a--) {
            statements;
            printf("%f\n",nums);
            nums++;		//this is an incrementing function
          }
        }
        return false;

        if doWeRestart == 0
        {
            updateUI()
        }
    }

    var timePassed: Float = 0.0

    @objc func updateUI(){

        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

    }

}
