//
//  ArtistsViewController.h
//  HelloWorld
//
//  Created by Allon Freedman on 21/1/15.
//  Copyright (c) 2015 Alfonzzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtistsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
- (IBAction)fadeButtonPressed:(id)sender;
- (IBAction)changeButtonPressed:(id)sender;
- (IBAction)moveButtonPressed:(id)sender;
- (IBAction)showSongsButtonPressed:(id)sender;

@end
