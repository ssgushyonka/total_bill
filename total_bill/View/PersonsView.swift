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
    
    let backgroundGrayView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8588235294, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 70, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 70, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 38, weight: .bold)
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
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),

            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10),
        ])
    }
}
