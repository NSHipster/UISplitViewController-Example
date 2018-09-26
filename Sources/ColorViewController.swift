import UIKit

class ColorViewController: UIViewController {
    var color: NamedColor? {
        didSet {
            guard let (name, color) = self.color else {
                return
            }
            
            self.title = name
            self.view.backgroundColor = color
        }
    }
}
