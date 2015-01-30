//
//  PlaylistViewController.h
//  HelloWorld
//
//  Created by Allon Freedman on 30/1/15.
//  Copyright (c) 2015 Alfonzzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaylistViewController : UIViewController

@property (copy, nonatomic) NSString *playlistName;
@property (weak, nonatomic) IBOutlet UILabel *playlistNameLabel;

@end
