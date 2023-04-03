import Foundation
import SwiftUI
import UIKit

struct MemojiInputView: UIViewControllerRepresentable {
    @Binding var memojiText: String
    @Binding var imageBase64String: String?
    @Binding var backgroundColor: LinearGradient

    func makeUIViewController(context: Context) -> MemojiInputViewController {
        return MemojiInputViewController(coordinator: makeCoordinator(), backgroundColor: $backgroundColor)
    }

    func updateUIViewController(_ viewController: MemojiInputViewController, context: Context) {
        // Send the input text to the input field
        viewController.textView.text = memojiText
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(memojiInputView: self, imageBase64String: $imageBase64String)
    }
    
    var textInputMode: UITextInputMode? {
            for mode in UITextInputMode.activeInputModes {
                if mode.primaryLanguage == "emoji" {
                    return mode
                }
            }
            return nil
    }
    
    
    class Coordinator: NSObject, UITextViewDelegate {
        var memojiInputView: MemojiInputView
        @Binding var imageBase64String: String?

        init(memojiInputView: MemojiInputView, imageBase64String: Binding<String?>) {
            self.memojiInputView = memojiInputView
            self._imageBase64String = imageBase64String
        }
        
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            // Check if the pasteboard contains an image
            if let image = UIPasteboard.general.image {
                
                // Convert the image to a base64-encoded string and set it as the memoji text
                let imageData = image.pngData()!
                let base64String = imageData.base64EncodedString()

                // Set the imageBase64String variable to the base64-encoded string of the image
                self.imageBase64String = base64String
            }

            // Return false to dont the string to be pasted into the text field
            return false
        }
    }
}

class MemojiInputViewController: UIViewController {
    var textView = EmojiTextField()
    var coordinator: MemojiInputView.Coordinator
    let memojiSelectorView: UIView
    
    init(textView: EmojiTextField = EmojiTextField(), coordinator: MemojiInputView.Coordinator, backgroundColor: Binding<LinearGradient>) {
        self.textView = textView
        self.coordinator = coordinator
        self.memojiSelectorView = UIHostingController(rootView: MemojiSelectorView(imageBase64String: coordinator.$imageBase64String, backgroundColor: backgroundColor)).view!
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonaction(button: UIButton) {
        print("clicked")
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        } else {
            textView.becomeFirstResponder()
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.addSubview(memojiSelectorView)
        
        memojiSelectorView.translatesAutoresizingMaskIntoConstraints = false
        memojiSelectorView.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
        memojiSelectorView.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
        memojiSelectorView.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        memojiSelectorView.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        memojiSelectorView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonaction)))
        
        
        //Setting Cursor color to none
        textView.tintColor = UIColor.clear
        textView.allowsEditingTextAttributes = true
        textView.delegate = coordinator
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

class EmojiTextField: UITextView {

    // required for iOS 13
    override var textInputContextIdentifier: String? { "" } // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}

struct MemojiInputView_Previews: PreviewProvider {
    static var previews: some View {
        MemojiInputView(memojiText: .constant("teste"), imageBase64String: .constant(.init()), backgroundColor: .constant(GlobalStyle().linearGray))
    }
}
