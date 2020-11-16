
import UIKit

class CustomAnswerButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        layer.cornerRadius = frame.height / 6
        titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        setTitleColor(.white, for: .normal)
    }
    
}
