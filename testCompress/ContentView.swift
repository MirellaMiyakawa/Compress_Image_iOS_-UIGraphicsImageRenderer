import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if let image = UIImage(named: "ImageTest") {
                let imagemCompactada = image.compactar(porcentagem: 0.4)
            
                if let arquivo = imagemCompactada {
                    let imageData = arquivo.pngData()
                    
                    Image(uiImage: arquivo)
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 200, height: 200)
                    
                    // Pega o tamanho da imagem
                    let imageSizeInKB = Double(imageData?.count ?? 0) / 1024.0
                    Text(String(format: "Image Size: %.2f KB", imageSizeInKB))
                    .padding()
                    
                    } else {
                        Text("Erro: Imagem não compactada")
                            .foregroundColor(.red)
                    }
                
            } else {
                Text("Erro: Imagem não encontrada")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIImage {
    func compactar(porcentagem: CGFloat) -> UIImage? {
        let canvas = CGSize(width: size.width * porcentagem, height: size.height * porcentagem)
        let format = imageRendererFormat
        format.opaque = true
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }

    func compactar(width: CGFloat) -> UIImage? {
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        let format = imageRendererFormat
        format.opaque = true
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}
