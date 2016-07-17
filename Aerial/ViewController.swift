//
//  ViewController.swift
//  SwiftSlideShow
//
//  Created by Malek T. on 4/13/15.
//  Copyright (c) 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    var moviePlayer : MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //1
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        
        // Create movie player and append to subview of scroll view
        let path = NSBundle.mainBundle().pathForResource("b6-2", ofType: "mov")
        let url = NSURL(fileURLWithPath: path!)
        self.moviePlayer = MPMoviePlayerController(contentURL: url)
        
        self.moviePlayer?.controlStyle = MPMovieControlStyle.None
        self.moviePlayer?.repeatMode = MPMovieRepeatMode.One
        self.moviePlayer?.scalingMode = MPMovieScalingMode.AspectFill
        self.moviePlayer?.view.frame = self.view.frame
        self.moviePlayer!.prepareToPlay()
        self.scrollView.addSubview(self.moviePlayer!.view)
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 5, self.scrollView.frame.height)
        self.scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.moviePlayer?.view.frame = self.view.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

