//
//  AddArticleViewController.swift
//  Masiuk2021
//
//  Created by Anton M on 6/24/21.
//

import UIKit
import Masiuk2021

// MARK: - AddArticle ViewController

class AddArticleViewController: UIViewController {
	
	// MARK: - IBOutlets

	@IBOutlet weak private var titleTextField: UITextField!
	@IBOutlet weak private var contentTextView: UITextView!
	
	// MARK: - ViewController Lifecycle Methods

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupSettings()
		setupViews()
	}

	// MARK: - Setup Methods

	private func setupSettings() {
		titleTextField.delegate = self
		view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing)))
	}
	
	private func setupViews() {
		contentTextView.textContainer.lineBreakMode = .byTruncatingTail
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: Const.AddArticleViewController.barButtontitle,
																												style: .plain,
																												target: self, action: #selector(doneEditingArticle))
	}
	
	// MARK: - IBActions

	@objc private func doneEditingArticle() {
		validateAndCreateArticleModel()
	}
	
	// MARK: - Private Methods

	private func validateAndCreateArticleModel() {
		guard let title = titleTextField.text, title != "" else {
			presentAlert(message: Const.AddArticleViewController.noTitleMessage)
			return
		}
		guard let content = contentTextView.text, content != "" else {
			presentAlert(message: Const.AddArticleViewController.noContentMessage)
			return
		}
		let _ = ArticleManager.shared.newArticle(title: title,
																						 content: content,
																						 language: Const.AddArticleViewController.language,
																						 image: nil)
		navigationController?.popViewController(animated: true)
	}
	
	private func presentAlert(message: String) {
		let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: Const.AddArticleViewController.alertActionTitle, style: .cancel, handler: nil))
		present(alert, animated: true)
	}
}

// MARK: - UITextFieldDelegate Extension

extension AddArticleViewController: UITextFieldDelegate {

	internal func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,
													replacementString string: String) -> Bool {
				let currentText = textField.text ?? ""
				guard let stringRange = Range(range, in: currentText) else { return false }
				let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
				return updatedText.count <= 20
	}
}

