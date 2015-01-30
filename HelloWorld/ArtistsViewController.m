//
//  ArtistsViewController.m
//  HelloWorld
//
//  Created by Allon Freedman on 21/1/15.
//  Copyright (c) 2015 Alfonzzz. All rights reserved.
//

#import "ArtistsViewController.h"
#import "SongsViewController.h"

@interface ArtistsViewController ()

@property (nonatomic) CGPoint topPosition;
@property (nonatomic) CGPoint previousLabelCenter;

@end

@implementation ArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  self.topPosition = CGPointMake(75, 75); // Arbitrary...
  self.previousLabelCenter = CGPointZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
  //   Pass the selected object to the new view controller.
//}


- (IBAction)fadeButtonPressed:(id)sender {
  [UIView animateWithDuration:1.0 animations:^{
    if (self.mainLabel.alpha == 0) {
      self.mainLabel.alpha = 1;
    } else {
      self.mainLabel.alpha = 0;
    }
  }];
}

- (IBAction)changeButtonPressed:(id)sender {
  self.mainLabel.text = ([self.mainLabel.text isEqualToString:@"Awesome!"]) ? @"Hello, Wordl!" : @"Awesome!";
}

- (IBAction)moveButtonPressed:(id)sender {
  CGPoint targetCenter = CGPointEqualToPoint(self.previousLabelCenter, CGPointZero) ? self.topPosition : self.previousLabelCenter;
  self.previousLabelCenter = self.mainLabel.center;
  [UIView animateWithDuration:1.0 animations:^{
    self.mainLabel.center = targetCenter;
  }];
}

- (IBAction)showSongsButtonPressed:(id)sender {
  SongsViewController *mySongVC = [[SongsViewController alloc] init];
  [self.navigationController pushViewController:mySongVC animated:YES];
}
@end
