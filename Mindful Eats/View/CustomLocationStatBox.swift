import UIKit

class CustomLocationStatBox: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
    
}
