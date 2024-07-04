import UIKit

class UpdatePopupViewController: UIViewController {
    var dataVersion:String = ""
    var dataURL:String = ""
    var isForce: Bool = false
    var image:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopup()
    }

    func setupPopup() {
        // Create the container view
        let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.98, alpha: 1.00)
        containerView.layer.cornerRadius = 15
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        

        // Create the image view for the rocket
        let rocketImageView = UIImageView()
        rocketImageView.image = UIImage(named: image) // Assuming you have a rocket image in your assets
        rocketImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(rocketImageView)

        // Create the title label
        let titleLabel = UILabel()
        titleLabel.text = "App Update Required!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)

        // Create the message label
        let messageLabel = UILabel()
        messageLabel.text = "We have added new features and fix some bugs to make your experience seamless.\nVersion 0 is available on the Appstore!"
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .gray
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(messageLabel)

        // Create the Update App button
        let updateButton = UIButton(type: .system)
        updateButton.setTitle("Update App", for: .normal)
        updateButton.backgroundColor = UIColor(red: 0.43, green: 0.36, blue: 0.98, alpha: 1.00)
        updateButton.setTitleColor(.white, for: .normal)
        updateButton.layer.cornerRadius = 10
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(updateButton)
        updateButton.addTarget(self, action: #selector(goesAppstore), for: .touchUpInside)

        // Create the Cancel button
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = UIColor(red: 0.43, green: 0.36, blue: 0.98, alpha: 1.00)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.layer.cornerRadius = 10
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(cancelButton)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.isHidden = isForce ? true : false

        // Add constraints
        NSLayoutConstraint.activate([
            // Container view constraints
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 400),

            // Rocket image constraints
            rocketImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            rocketImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            rocketImageView.widthAnchor.constraint(equalToConstant: 100),
            rocketImageView.heightAnchor.constraint(equalToConstant: 100),

            // Title label constraints
            titleLabel.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            // Message label constraints
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            // Update button constraints
            updateButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: isForce ? 30 : -10),
            updateButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            updateButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            updateButton.heightAnchor.constraint(equalToConstant: 44),

            // Cancel button constraints
            cancelButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            cancelButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            cancelButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc func cancelButtonTapped() {
            // Implement your cancel button action here
            print("Cancel button tapped")
             if !isForce {
             self.dismiss(animated: false)
             }
    }
    
    @objc func goesAppstore() {
            // Implement your cancel button action here
            print("Update button tapped")
            guard let url = URL(string: dataURL) else { return }
            UIApplication.shared.openURL(url)
            if !isForce {
            self.dismiss(animated: false)
            }
    }
}
