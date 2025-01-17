import Foundation
import UIKit

class TotalBillView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Общий счет"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.8588235294, blue: 0.8666666667, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 38, weight: .bold)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(summTextField)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            summTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            summTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            summTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            summTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
