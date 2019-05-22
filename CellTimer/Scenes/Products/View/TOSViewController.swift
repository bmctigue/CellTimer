//
//  TOSViewController.swift
//  CellTimer
//
//  Created by Bruce McTigue on 4/7/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import ChameleonFramework

class TOSViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dismissButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.containerView.layer.cornerRadius = 8.0
        self.containerView.layer.borderWidth = 1.0
        self.containerView.layer.borderColor = FlatGrayDark().cgColor
        self.dismissButton.layer.cornerRadius = 8.0
        self.dismissButton.layer.borderWidth = 1.0
        self.dismissButton.layer.borderColor = FlatGrayDark().cgColor
        self.titleLabel.text = "TOS and Privacy Policy"
        self.textView.text = """
        Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. Phasellus ante pellentesque erat cum risus consequat imperdiet aliquam, integer placerat et turpis mi eros nec lobortis taciti, vehicula nisl litora tellus ligula porttitor metus.
        
        Vivamus integer non suscipit taciti mus etiam at primis tempor sagittis sit, euismod libero facilisi aptent elementum felis blandit cursus gravida sociis erat ante, eleifend lectus nullam dapibus netus feugiat curae curabitur est ad. Massa curae fringilla porttitor quam sollicitudin iaculis aptent leo ligula euismod dictumst, orci penatibus mauris eros etiam praesent erat volutpat posuere hac. Metus fringilla nec ullamcorper odio aliquam lacinia conubia mauris tempor, etiam ultricies proin quisque lectus sociis id tristique, integer phasellus taciti pretium adipiscing tortor sagittis ligula.
        
        Mollis pretium lorem primis senectus habitasse lectus scelerisque donec, ultricies tortor suspendisse adipiscing fusce morbi volutpat pellentesque, consectetur mi risus molestie curae malesuada cum. Dignissim lacus convallis massa mauris enim ad mattis magnis senectus montes, mollis taciti phasellus accumsan bibendum semper blandit suspendisse faucibus nibh est, metus lobortis morbi cras magna vivamus per risus fermentum. Dapibus imperdiet praesent magnis ridiculus congue gravida curabitur dictum sagittis, enim et magna sit inceptos sodales parturient pharetra mollis, aenean vel nostra tellus commodo pretium sapien sociosqu.
        """
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.layoutIfNeeded()
        textView.contentOffset = CGPoint.zero
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
