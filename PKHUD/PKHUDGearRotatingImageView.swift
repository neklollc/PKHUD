//
//  RKHUDRotatingImageView.swift
//  Raken
//
//  Created by Smolsky Aleksey on 10.07.2018.
//  Copyright © 2018 Raken, Inc. All rights reserved.
//

open class PKHUDGearRotatingImageView: PKHUDRotatingImageView {
    
    public enum HUDMode {
        case standart
        case clear
    }
    
    public init(image: UIImage? = nil, subtitle: String? = nil, frame: CGRect? = nil, mode: HUDMode = .standart) {
        let newFrame = frame ?? CGRect(origin: CGPoint.zero, size: CGSize(width: 156.0, height: 156.0))
        super.init(frame: newFrame)
        self.imageView.image = image ?? PKHUDAssets.gearCircularImage
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = UIColor(red:0.95, green:0.4, blue:0.12, alpha:1)
        
        addSubview(imageView)
        addSubview(subtitleLabel)

        if mode == .standart {
            self.backgroundColor = UIColor.white
            self.alpha = 0.95
            self.layer.cornerRadius = 2
            self.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.23).cgColor
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 30
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        let viewWidth = bounds.size.width
        let viewHeight = bounds.size.height
        
        let quarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0)))
        let threeQuarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0 * 3.0)))
        
        imageView.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: viewWidth,
                                                                               height: subtitleLabel.text == nil ? viewHeight : threeQuarterHeight ))
        subtitleLabel.frame = CGRect(origin: CGPoint(x: 0.0, y: threeQuarterHeight), size: CGSize(width: viewWidth, height: quarterHeight))
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
