//
//  CustomFrameView.swift
//  PKHUD
//
//  Created by Smolsky Aleksey on 10.07.2018.
//  Copyright © 2018 NSExceptional. All rights reserved.
//

import UIKit

/// Provides the general look and feel of the PKHUD, into which the eventual content is inserted.
internal class CustomFrameView: UIView {
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.addSubview(self.content)
    }
    
    fileprivate var _content = UIView()
    internal var content: UIView {
        get {
            return _content
        }
        set {
            _content.removeFromSuperview()
            _content = newValue
            _content.contentMode = .center
            frame.size = _content.bounds.size
            self.addSubview(_content)
        }
    }
}

