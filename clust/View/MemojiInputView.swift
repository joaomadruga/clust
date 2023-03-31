import Foundation
import SwiftUI
import UIKit

struct MemojiInputView: UIViewControllerRepresentable {
    @Binding var memojiText: String
    @Binding var imageBase64String: String?

    func makeUIViewController(context: Context) -> MemojiInputViewController {
        let viewController = MemojiInputViewController()
        viewController.coordinator = makeCoordinator()
        return viewController
    }

    func updateUIViewController(_ viewController: MemojiInputViewController, context: Context) {
        // Send the input text to the input field
        viewController.textView.text = memojiText
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(memojiInputView: self, imageBase64String: $imageBase64String)
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
                let imageData = image.jpegData(compressionQuality: 1.0)!
                let base64String = imageData.base64EncodedString()

                // Set the imageBase64String variable to the base64-encoded string of the image
                self.imageBase64String = base64String
            }

            // Return true to allow the string to be pasted into the text field
            return true
        }
    }
}

class MemojiInputViewController: UIViewController {
    var textView = UITextView()
    var coordinator: MemojiInputView.Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = "Insira memoji"
        textView.allowsEditingTextAttributes = true
        textView.delegate = coordinator
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         
    }
}

struct MemojiInputView_Previews: PreviewProvider {
    static var previews: some View {
        MemojiInputView(memojiText: .constant("teste"), imageBase64String: .constant(.init()))
    }
}
