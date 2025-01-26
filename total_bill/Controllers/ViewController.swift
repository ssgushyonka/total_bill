
import UIKit

class ViewController: UIViewController {

    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Общий счет"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MoneyImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите сумму счета и нажмите \"Рассчитать\""
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.7
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Рассчитать", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.97, green: 0.97, blue: 0.95, alpha: 1)
        setUpViews()
        setUpConstraints()
        addTap()
    }

    func setUpViews() {
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
    }

    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}

extension ViewController {
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 18),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalToConstant: 130),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalToConstant: 130),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalToConstant: 130),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 5),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}

extension ViewController {
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.backgroundGrayView.text,
              let totalBillInt = Int(totalBill) else { return }
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter
        if persons == 0 {
            descriptionLabel.text = "Введите количество персон"
            descriptionLabel.textColor = .red
        } else {
            let result = summ / persons
            descriptionLabel.text = "\(result) на человека"
            descriptionLabel.textColor = .black
            print(result)
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
