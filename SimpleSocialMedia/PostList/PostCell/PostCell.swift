//
//  PostCell.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 18.11.2025.
//

import UIKit

class PostCell: UITableViewCell {
    
    var viewModel: PostCellViewModelProtocol! {
        didSet {
            configure()
        }
    }
    
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person") //test
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .orange //test
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
//        label.text = "Title" //test
        label.backgroundColor = .blue //test
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postBodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
//        label.text = "Title 2 for text" //test
        label.backgroundColor = .systemMint //test
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .systemGray //test
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupSubviews(
            cellView,
            userAvatarImageView,
            postTitleLabel,
            postBodyLabel,
            favoriteButton
        )
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Methods
extension PostCell {
    private func configure() {
        postTitleLabel.text = viewModel.postTitle
        postBodyLabel.text = viewModel.postBody
    }
    
    private func setupCell() {
        backgroundColor = .black
        selectionStyle = .none
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 50),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 50),
            userAvatarImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            userAvatarImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            postTitleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            postTitleLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 16),
            postTitleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            postBodyLabel.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor, constant: 16),
            postBodyLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 16),
            postBodyLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            favoriteButton.topAnchor.constraint(equalTo: postBodyLabel.bottomAnchor, constant: 16),
            favoriteButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            favoriteButton.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16)
        ])
    }
}
