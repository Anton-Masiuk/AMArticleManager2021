//
//  AddArticleViewController.swift
//  Exercise2
//
//  Created by MSQUARDIAN on 6/24/21.
//

import UIKit
import Masiuk2021

// MARK: - AddDeathNoteViewController

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
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain,
																												target: self, action: #selector(doneEditingNewNote))
	}
	
	// MARK: - IBActions

	@objc private func doneEditingNewNote() {
		validateAndCreateArticleModel()
	}
	
	// MARK: - Private Methods

	private func validateAndCreateArticleModel() {
		guard let title = titleTextField.text, title != "" else {
			presentAlert(message: "Please enter article's title")
			return
		}
		guard let content = contentTextView.text, content != "" else {
			presentAlert(message: "Please enter article's content")
			return
		}
		let _ = ArticleManager.shared.newArticle(title: title, content: content, language: "en", image: nil)
		navigationController?.popViewController(animated: true)
	}
	
	private func presentAlert(message: String) {
		let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
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

