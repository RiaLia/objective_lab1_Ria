//
//  StartViewController.m
//  MeMyselfAndI
//
//  Created by Ria Buhlin on 2018-02-03.
//  Copyright © 2018 Ria Buhlin. All rights reserved.
//

#import "StartViewController.h"
#import "GameViewController.h"

@interface StartViewController ()
@property (nonatomic) UIColor *myColor;
@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeColor{
    self.view.backgroundColor = self.myColor;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GameViewController *game = [segue destinationViewController];
    game.myColor = self.myColor;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
