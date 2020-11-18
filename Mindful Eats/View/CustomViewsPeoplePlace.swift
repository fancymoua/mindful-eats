import UIKit

class CustomViewsPeoplePlace: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = frame.height / 10
        backgroundColor = .white
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.lightGray.cgColor
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1.5, height: 4.0)
        layer.shadowRadius = 2.0
        layer.masksToBounds = false
        
//        tabBarController?.tabBar.layer.shadowColor = UIColor.gray.cgColor
//        tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.3)
//        tabBarController?.tabBar.layer.shadowRadius = 2.5
//        tabBarController?.tabBar.layer.shadowOpacity = 0.6
//        tabBarController?.tabBar.layer.masksToBounds = false
    }
    
}
