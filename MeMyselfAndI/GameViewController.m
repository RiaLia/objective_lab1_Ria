//
//  GameViewController.m
//  MeMyselfAndI
//
//  Created by Ria Buhlin on 2018-01-23.
//  Copyright © 2018 Ria Buhlin. All rights reserved.
//

#import "GameViewController.h"
//#import "colorThemes.m"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *instText;
@property (weak, nonatomic) IBOutlet UITextField *userNumber;
@property (weak, nonatomic) IBOutlet UIButton *guessBtn;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (weak, nonatomic) IBOutlet UILabel *whiteText;
@property (weak, nonatomic) IBOutlet UILabel *grayText;
@property (weak, nonatomic) IBOutlet UILabel *blackText;


@property (nonatomic) NSInteger mysteryNumber;
@property (nonatomic) NSInteger number;
@property (weak, nonatomic) IBOutlet UISlider *slider;

//@property colorThemes *color;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playBtn.hidden = YES;
    self.guessBtn.hidden = NO;
    self.mysteryNumber = [self randomNumber];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)randomNumber{
    NSInteger mysteryNumber = (arc4random_uniform(100)+1);
    return mysteryNumber;
}

-(NSInteger)countNumber {
    NSString *myText = self.userNumber.text;
    NSInteger number = [myText integerValue];
   
    return number;
}

- (IBAction)gueesNumber:(id)sender {
    self.number = [self countNumber];
    
    if(self.number == self.mysteryNumber){
        self.answer.text = @"Grattis du gissade rätt!";
        self.guessBtn.hidden = YES;
        self.playBtn.hidden = NO;
    }
    else if(self.number > self.mysteryNumber){
        self.answer.text = @"För högt, gissa igen";
    }
    else if(self.number < self.mysteryNumber){
        self.answer.text = @"För lågt, gissa igen";
    }
 
}

- (IBAction)playAgain:(id)sender {
    [self viewDidLoad];
}

- (IBAction)changeTheme:(id)sender {
    float sliderValue = self.slider.value;

    if(sliderValue < 1.5){
        self.myColor = [UIColor colorWithRed:87.0/255.0f green:132.0/255.0f blue:163.0/255.0f alpha:0.7];
        self.view.backgroundColor = self.myColor;
    
    }
    else if(sliderValue > 1.5 && sliderValue < 2.5){
        self.myColor = [UIColor colorWithRed:127.0/255.0f green:103.0/255.0f blue:153.0/255.0f alpha:1.0];
        self.view.backgroundColor = self.myColor;
    }
    else if(sliderValue > 2.5){
        self.myColor = [UIColor colorWithRed:255.0/255.0f green:139.0/255.0f blue:177.0/255.0f alpha:0.5];
        self.view.backgroundColor = self.myColor;
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
