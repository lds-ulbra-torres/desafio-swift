//
//  ARMessageView.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

let kMessageViewTag: Int = 14141

class ARMessageView: UIView {
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        return stackView
    }()
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("RECARREGAR", for: .normal)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.setTitleColor(#colorLiteral(red: 0.8745098039, green: 0.5490196078, blue: 0, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        return btn
    }()
    var imageSide: CGFloat = 40 {
        didSet {
            imageViewWidthConstraint.constant = imageSide
            imageViewHeightConstraint.constant = imageSide
        }
    }
    var tappedButtonCompletion: (() -> Void)?
    init(image: UIImage, text: String) {
        super.init(frame: .zero)
        imageView.image = image
        labelView.text = text
        commomInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commomInit()
    }
    private func commomInit() {
        addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(labelView)
        contentView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(button)
    }
    @objc private func touchUpInsideButton() {
        tappedButtonCompletion?()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    var imageViewHeightConstraint: NSLayoutConstraint!
    var imageViewWidthConstraint: NSLayoutConstraint!
    private func setConstraints() {
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 50)
        imageViewHeightConstraint.isActive = true
        imageViewWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: 100)
        imageViewWidthConstraint.isActive = true
        labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        buttonsStackView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
enum Icon {
    case notFound
    var image: UIImage {
        switch self {
        case .notFound: return #imageLiteral(resourceName: "error")
        }
    }
}
extension UIView {
    func displayMessageView(
        icon: Icon,
        text: String,
        sizeIcon: Int,
        backgroundColor: UIColor = .white,
        isButton: Bool = false,
        titleButton: String = "RELOAD",
        completion:(() -> Void)? = nil) {
        let messageView = ARMessageView(image: icon.image, text: text)
        messageView.tag = kMessageViewTag
        messageView.layer.masksToBounds = true
        messageView.backgroundColor = backgroundColor
        messageView.button.isHidden = !isButton
        messageView.button.setTitle(titleButton, for: .normal)
        messageView.tappedButtonCompletion = completion
        addContainerView(messageView)
    }
    func dismissMessageView() {
        viewWithTag(kMessageViewTag)?.removeFromSuperview()
    }
}
