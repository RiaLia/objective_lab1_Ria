//
//  GameViewController.m
//  MeMyselfAndI
//
//  Created by Ria Buhlin on 2018-01-23.
//  Copyright © 2018 Ria Buhlin. All rights reserved.
//

#import "GameViewController.h"
#import "StartViewController.h"


@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *instText;
@property (weak, nonatomic) IBOutlet UIButton *guessBtn;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (nonatomic) NSInteger mysteryNumber;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic) UIColor *myColor;
@property (weak, nonatomic) IBOutlet UISlider *numberSlider;
@property (weak, nonatomic) IBOutlet UILabel *numberValue;
@property (nonatomic) int smallValue;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playBtn.hidden = YES;
    self.guessBtn.hidden = NO;
    self.mysteryNumber = [self randomNumber];
    [self setText];
    
    CGAffineTransform trans = CGAffineTransformMakeRotation(-M_PI_2);
    self.numberSlider.transform = trans;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)randomNumber{
    int mysteryNumber = (arc4random_uniform(100)+1);
    return mysteryNumber;
}

-(int)setText{
    float value = self.numberSlider.value;
    int smallValue = (int)value;
    NSString *valueText =[NSString stringWithFormat:@"%d", smallValue];
    self.numberValue.text = valueText;
    
    return smallValue;
}

- (IBAction)changeValue:(id)sender {
    [self setText];
}

- (IBAction)gueesNumber:(id)sender {
    self.smallValue = [self setText];
    
    if(self.smallValue == self.mysteryNumber){
        self.answer.text = @"Grattis du gissade rätt!";
        self.guessBtn.hidden = YES;
        self.playBtn.hidden = NO;
    }
    else if(self.smallValue > self.mysteryNumber){
        self.answer.text = @"För högt, gissa igen";
    }
    else if(self.smallValue < self.mysteryNumber){
        self.answer.text = @"För lågt, gissa igen";
    }
 
}

- (IBAction)playAgain:(id)sender {
    [self viewDidLoad];
}

- (IBAction)changeTheme:(id)sender {
    float sliderValue = self.slider.value;

    if(sliderValue < 1.5){
         self.view.backgroundColor = [UIColor colorWithRed:73.0/255.0f green:94.0/255.0f blue:133.0/255.0f alpha:1.0];
    }
    else if(sliderValue > 1.5 && sliderValue < 2.5){
        self.view.backgroundColor = [UIColor colorWithRed:105.0/255.0f green:86.0/255.0f blue:127.0/255.0f alpha:1.0];
    }
    else if(sliderValue > 2.5){
         self.view.backgroundColor =  [UIColor colorWithRed:148.0/255.0f green:81.0/255.0f blue:102.0/255.0f alpha:1.0];
    }
}


@end
