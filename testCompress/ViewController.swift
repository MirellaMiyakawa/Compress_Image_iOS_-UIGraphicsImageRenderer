import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crie uma instância de UIImage a partir de um arquivo de imagem
        if let image = UIImage(named: "ImageTest") {
            
            // Crie uma instância de UIImageView usando a imagem
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width / 2, height: view.frame.size.height / 2)
            imageView.center = view.center
            
            // Adicione o UIImageView à visualização principal
            view.addSubview(imageView)
        } else {
            print("Erro: Imagem não encontrada")
        }
    }
}
