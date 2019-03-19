//
//  FirstViewController.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 3/3/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit
import SnapKit

private let scrollView = UIScrollView()
private let infoText = UILabel()
private let imageView = UIImageView()
private let label1 = UILabel()
private let label2 = UITextView()

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        imageView.image = UIImage(named: "Header2")
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        label1.frame = CGRect(x:0, y:0, width:0.2 , height: 0.4)
        label1.text = "UVM FABLAB"
        label1.textAlignment = .center
        label1.textColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.3333333333, alpha: 1)
        label1.font = UIFont(name: "GoboldBold", size: CGFloat(30))
        label1.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        label1.clipsToBounds = true

        label2.frame = CGRect(x:0, y:0, width:imageView.frame.width , height:imageView.frame.height)
        label2.text = "\n An incubator for ideas and a place to engage people’s imaginations, the UVM FabLab makes rapid-prototyping tools available to UVM students and faculty."
        label2.textAlignment = .center
        label2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label2.font = UIFont(name: "Brown-Regular", size: CGFloat(12))
        label2.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        label2.clipsToBounds = true
        
        infoText.textColor = .black
        infoText.font = UIFont(name: "Brown-Regular", size: CGFloat(14))
        infoText.numberOfLines = 0
        let text =  """
                    Lorem ipsum dolor sit amet, in alia adhuc aperiri nam. Movet scripta tractatos cu eum, sale commodo meliore ea eam, per commodo atomorum ea. Unum graeci iriure nec an, ea sit habeo movet electram. Id eius assum persius pro, id cum falli accusam. Has eu fierent partiendo, doming expetenda interesset cu mel, tempor possit vocent in nam. Iusto tollit ad duo, est at vidit vivendo liberavisse, vide munere nonumy sed ex.
                            
                    Quod possit expetendis id qui, consequat vituperata ad eam. Per cu elit latine vivendum. Ei sit nullam aliquam, an ferri epicuri quo. Ex vim tibique accumsan erroribus. In per libris verear adipiscing. Purto aliquid lobortis ea quo, ea utinam oportere qui.
                    """
        infoText.text = text + text + text
        
        let textContainer = UIView()
        textContainer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(textContainer)
        
        imageView.addSubview(label1)
        imageView.addSubview(label2)
        textContainer.addSubview(infoText)
        
        scrollView.snp.makeConstraints {
            make in
            
            make.edges.equalTo(view)
        }
        
        imageView.snp.makeConstraints {
            make in
            
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.7)
        }
        label1.snp.makeConstraints {
            make in
            
            make.width.equalTo(200)
            make.height.equalTo(60)
            make.centerX.equalTo(95)
            make.centerY.equalTo(120)
        }
        label2.snp.makeConstraints {
            make in
            
            make.width.equalTo(250)
            make.height.equalTo(80)
            make.centerX.equalTo(150)
            make.centerY.equalTo(180)
        }
        textContainer.snp.makeConstraints {
            make in
            
            make.top.equalTo(imageView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(scrollView)
        }
        
        infoText.snp.makeConstraints {
            make in
            
            make.edges.equalTo(textContainer).inset(14)
        }
    }
    
    

}


