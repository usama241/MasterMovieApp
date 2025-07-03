import UIKit

class ProductionCompaniesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.masksToBounds = true
        bgView.layer.borderWidth = 0.3
        bgView.layer.borderColor = UIColor.black.cgColor
    }

}
