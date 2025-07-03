import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var genrelabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backGroundView.layer.cornerRadius = 5.0
        backGroundView.layer.masksToBounds = true
    }
}
