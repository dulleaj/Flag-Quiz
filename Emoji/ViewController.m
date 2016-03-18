//
//  ViewController.m
//  Emoji
//
//  Created by Andrew Dulle on 3/1/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *emojiLabel;

@property (weak, nonatomic) IBOutlet UITextField *answerLabel;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property NSTimer* answerTimer;
@property int timerSeconds;

@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property int totalCorrectAnswers;

@property (weak, nonatomic) IBOutlet UILabel *incorrectLabel;
@property int totalIncorrectAnswers;

@property (weak, nonatomic) IBOutlet UILabel *streakLabel;
@property int streak;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property int emojiInt;

@property NSString* answer;
@property NSString* userAnswer;

@property NSUserDefaults* defaults;

@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@property int theHighScore;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.emojiLabel.hidden = YES;
    self.answerLabel.hidden = YES;
    self.timerLabel.hidden = YES;
    self.correctLabel.hidden = YES;
    self.incorrectLabel.hidden = YES;
    self.streakLabel.hidden = YES;
    self.submitButton.hidden = YES;
    self.startButton.hidden = NO;
    self.highScoreLabel.hidden = NO;
    
    self.title = @"Flag Quiz";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; //Read High Score
    
    self.theHighScore = (int)[defaults integerForKey:@"HighScore"];
    
    self.highScoreLabel.text = [NSString stringWithFormat:@"Streak Record: %d",self.theHighScore];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) startButtonWasTapped:(id)sender {

    [self askQuestion];
    
}

- (IBAction) submitButtonWasTapped:(id)sender {
    
    [self.answerTimer invalidate];
    
    self.answerTimer = nil;
    
    self.answerTimer = [[NSTimer alloc] init];
    
    self.timerSeconds = 10;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%d",self.timerSeconds];
    
    self.userAnswer = self.answerLabel.text;
    
    NSString *countryWithSpace = [NSString stringWithFormat:@"%@ ",self.answer];
    
    NSString *lowerUserAnswer = [self.userAnswer lowercaseString];
    
    NSString *lowerAnswer = [self.answer lowercaseString];
    
    NSString *lowerCountryWithSpace = [countryWithSpace lowercaseString];
    
    if ([lowerAnswer isEqualToString: lowerUserAnswer] || [lowerAnswer isEqualToString:lowerCountryWithSpace]) {
        
        self.streak += 1;
        
        self.totalCorrectAnswers += 1;
    
        self.correctLabel.text = [NSString stringWithFormat:@"Total Correct: %d", self.totalCorrectAnswers];
        
        self.answerLabel.text = nil;
        
        [self askQuestion];
        
    } else {
        
        if (self.streak > self.theHighScore) {
            
            self.defaults = [NSUserDefaults standardUserDefaults]; //Set High Score
            
            [self.defaults setInteger:self.streak forKey:@"HighScore"];
            
            [self.defaults synchronize];
            
        }
        
        self.defaults = [NSUserDefaults standardUserDefaults]; //Read High Score
        
        self.theHighScore = (int)[self.defaults integerForKey:@"HighScore"];
        
        self.highScoreLabel.text = [NSString stringWithFormat:@"Streak Record: %d",self.theHighScore];
        
        self.streak = 0;
        
        self.totalIncorrectAnswers += 1;
        
        self.incorrectLabel.text = [NSString stringWithFormat:@"Total Incorrect: %d", self.totalIncorrectAnswers];
        
        self.answerLabel.text = nil;
        
        [self askQuestion];
        
    }
    
}

- (void) askQuestion {
    
    if (self.streak < 11) {
        
        self.emojiInt = arc4random_uniform(11);
        
    }else if (self.streak > 11) {
        
        self.emojiInt = arc4random_uniform(12)+10;
        
    }
    
    if (self.emojiInt == 0) {
        
        self.emojiLabel.text = @"🇩🇪";//Germany
        self.answer = @"GERMANY";
        
    }else if (self.emojiInt == 1) {
        
        self.emojiLabel.text = @"🇫🇷";//France
        self.answer = @"FRANCE";
        
    }else if (self.emojiInt == 2) {
        
        self.emojiLabel.text = @"🇨🇭";//Switzerland
        self.answer = @"SWITZERLAND";
        
    }else if (self.emojiInt == 3) {
        
        self.emojiLabel.text = @"🇧🇷";//Brazil
        self.answer = @"BRAZIL";
    
    }else if (self.emojiInt == 4) {
        
        self.emojiLabel.text = @"🇬🇷";//Greece
        self.answer = @"GREECE";
    
    }else if (self.emojiInt == 5) {
        
        self.emojiLabel.text = @"🇧🇪";//Belgium
        self.answer = @"BELGIUM";
    }else if (self.emojiInt == 6) {
        
        self.emojiLabel.text = @"🇯🇵";//Japan
        self.answer = @"JAPAN";
    }else if (self.emojiInt == 7) {
        
        self.emojiLabel.text = @"🇳🇱";//Netherlands
        self.answer = @"NETHERLANDS";
    }else if (self.emojiInt == 8) {
        
        self.emojiLabel.text = @"🇦🇺";//Australia
        self.answer = @"AUSTRALIA";
    }else if (self.emojiInt == 9) {
        
        self.emojiLabel.text = @"🇨🇦";//Canada
        self.answer = @"CANADA";
    }else if (self.emojiInt == 10) {
        
        self.emojiLabel.text = @"🇺🇸";//United States of America
        self.answer = @"USA";
    
    }else if (self.emojiInt == 11) {
        
        self.emojiLabel.text = @"🇮🇹";//Italy
        self.answer = @"ITALY";
        
    }else if (self.emojiInt == 12) {
        
        self.emojiLabel.text = @"🇵🇪";//Peru
        self.answer = @"PERU";
        
    }else if (self.emojiInt == 13) {
        
        self.emojiLabel.text = @"🇹🇷";//Turkey
        self.answer = @"TURKEY";
        
    }else if (self.emojiInt == 14) {
        
        self.emojiLabel.text = @"🇳🇴";//Norway
        self.answer = @"NORWAY";
        
    }else if (self.emojiInt == 15) {
        
        self.emojiLabel.text = @"🇨🇱";//Chile
        self.answer = @"CHILE";
        
    }else if (self.emojiInt == 16) {
        
        self.emojiLabel.text = @"🇩🇰";//Denmark
        self.answer = @"DENMARK";
        
    }else if (self.emojiInt == 17) {
        
        self.emojiLabel.text = @"🇨🇳";//China
        self.answer = @"CHINA";
        
    }else if (self.emojiInt == 18) {
        
        self.emojiLabel.text = @"🇨🇺";//Cuba
        self.answer = @"CUBA";
        
    }else if (self.emojiInt == 19) {
        
        self.emojiLabel.text = @"🇫🇮";//Finland
        self.answer = @"FINLAND";
        
    }else if (self.emojiInt == 20) {
        
        self.emojiLabel.text = @"🇬🇪";//Georgia
        self.answer = @"GEORGIA";
        
    }else if (self.emojiInt == 21) {
        
        self.emojiLabel.text = @"🇲🇽";//Mexico
        self.answer = @"MEXICO";
        
    }
    
    if (self.streak >=5) {
        
        self.streakLabel.hidden = NO;
        
        self.streakLabel.text = [NSString stringWithFormat:@"Streak: %d",self.streak];
        
    } else if (self.streak < 5) {
        
        self.streakLabel.hidden = YES;
        
    }

    self.emojiLabel.hidden = NO;
    self.answerLabel.hidden = NO;
    self.timerLabel.hidden = NO;
    self.correctLabel.hidden = NO;
    self.incorrectLabel.hidden = NO;
    self.submitButton.hidden = NO;
    self.startButton.hidden = YES;
    self.highScoreLabel.hidden = NO;
    
    self.timerSeconds = 10;
    
    self.answerTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0
    target: self
    selector:@selector(lessSecond)
    userInfo: nil
    repeats:YES];
    
}

- (void) lessSecond {
    
    self.timerSeconds -= 1;

    self.timerLabel.text = [NSString stringWithFormat:@"%d",self.timerSeconds];
    NSLog(@"%d",self.timerSeconds);
    
    if (self.timerSeconds <= 0) {
        
        [self.answerTimer invalidate];
        
        self.defaults = [NSUserDefaults standardUserDefaults]; //Set High Score
        
        [self.defaults setInteger:self.streak forKey:@"HighScore"];
        
        [self.defaults synchronize];
    
        self.defaults = [NSUserDefaults standardUserDefaults]; //Read High Score
        
        self.theHighScore = (int)[self.defaults integerForKey:@"HighScore"];
        
        self.highScoreLabel.text = [NSString stringWithFormat:@"Streak Record: %d",self.theHighScore];
        
        self.streak = 0;
    
        self.totalIncorrectAnswers += 1;
    
        self.incorrectLabel.text = [NSString stringWithFormat:@"Total Incorrect: %d", self.totalIncorrectAnswers];
    
        self.answerLabel.text = nil;
    
        [self askQuestion];
    
    }

}


@end
