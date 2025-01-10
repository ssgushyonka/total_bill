import Foundation
import UIKit

class PersonsView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество персон"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
    }
    
    func setUpConstraints() {
        
    }
}
