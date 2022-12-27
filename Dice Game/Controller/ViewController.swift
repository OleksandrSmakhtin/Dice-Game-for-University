//
//  ViewController.swift
//  Dice Game
//
//  Created by Oleksandr Smakhtin on 25.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let diceStack = UIStackView()
    let colorStack = UIStackView()
    
    let colors = [
        UIColor.orange, UIColor.black, UIColor.white, UIColor.systemBlue, UIColor.darkGray, UIColor.systemGreen, UIColor.purple,
        UIColor.red, UIColor.systemPink, UIColor.systemYellow
    ]

        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(colorStack)
        view.addSubview(rollBtn)
        view.addSubview(diceStack)
        view.addSubview(scoreLbl)
        conf()
    }
    
    
    
    private let bgColorBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("Change bg", for: .normal)
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(changeBg), for: .touchUpInside)
        return btn
    }()
    

    @objc func changeBg() {
        
        let color = colors.randomElement()
        if color == rollBtn.backgroundColor {
            return
        }
        view.backgroundColor = color
        bgColorBtn.setTitleColor(color, for: .normal)
        rollBtn.setTitleColor(color, for: .normal)
        viewsColorBtn.setTitleColor(color, for: .normal)
        
    }
    
    
    
    private let viewsColorBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("Change dice", for: .normal)
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(changeDice), for: .touchUpInside)
        return btn
    }()
    
    @objc func changeDice() {
        
        let color = colors.randomElement()
        if color == view.backgroundColor {
            return
        }
        scoreLbl.textColor = color
        viewsColorBtn.backgroundColor = color
        viewsColorBtn.tintColor = view.backgroundColor
        bgColorBtn.backgroundColor = color
        bgColorBtn.tintColor = view.backgroundColor
        print(view.backgroundColor)
        rollBtn.backgroundColor = color
        dice_1.tintColor = color
        dice_2.tintColor = color
        
        
    }
    
    
    private let scoreLbl: UILabel = {
        let label = UILabel()
        label.text = "SOME TEXT"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.isHidden = true
        return label
    }()
    
    
    
    
    
    private let rollBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 10
        btn.setTitle("ROLL", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(roll), for: .touchUpInside)
        return btn
    }()
    
    @objc func roll() {
        
        let newDice_1 = Dices.dices.randomElement()
        let newDice_2 = Dices.dices.randomElement()
        
        //dice_1.image = UIImage(named: "dice\(Int.random(in: 1...6))")?.withRenderingMode(.alwaysTemplate)
        //dice_2.image = UIImage(named: "dice\(Int.random(in: 1...6))")?.withRenderingMode(.alwaysTemplate)
        dice_1.image = newDice_1?.dice.withRenderingMode(.alwaysTemplate)
        dice_2.image = newDice_2?.dice.withRenderingMode(.alwaysTemplate)
        
        scoreLbl.isHidden = false
        scoreLbl.text = String("SCORE:  ") + String(newDice_1!.number + newDice_2!.number)
        
    }
    
    
    private var dice_1: UIImageView = {
        let image = UIImage(named: "dice1")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.tintColor = .orange
        return imageView
    }()
    
    private var dice_2: UIImageView = {
        let image = UIImage(named: "dice2")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.tintColor = .orange
        return imageView
    }()
    
    
    
    
    
    
    func conf() {
        
        colorStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        colorStack.axis = .horizontal
        colorStack.distribution = .equalSpacing
        colorStack.addArrangedSubview(bgColorBtn)
        colorStack.addArrangedSubview(viewsColorBtn)
        
        
        bgColorBtn.snp.makeConstraints { make in
            make.width.equalTo(110)
        }
        
        viewsColorBtn.snp.makeConstraints { make in
            make.width.equalTo(110)
        }
        
        
        dice_1.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        dice_2.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        
        scoreLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(diceStack.snp_topMargin).offset(-30)
        }
        
        
        diceStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        diceStack.addArrangedSubview(dice_1)
        diceStack.addArrangedSubview(dice_2)
        diceStack.distribution = .fillEqually
        diceStack.spacing = 60
        
        rollBtn.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottomMargin.equalToSuperview().inset(70)
        }
    }
    
    
    
    

}

