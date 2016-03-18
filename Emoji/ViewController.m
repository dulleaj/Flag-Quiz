//
//  ViewController.m
//  Emoji
//
//  Created by Andrew Dulle on 3/1/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "ViewController.h"
#import "Flag.h"

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

@property Flag *flagObject;

@property NSMutableArray *incorrectAnswers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.incorrectAnswers = [[NSMutableArray alloc] init];
    
    self.emojiLabel.hidden = YES;
    self.answerLabel.hidden = YES;
    self.timerLabel.hidden = YES;
    self.correctLabel.hidden = YES;
    self.incorrectLabel.hidden = YES;
    self.streakLabel.hidden = YES;
    self.submitButton.hidden = YES;
    self.startButton.hidden = NO;
    self.highScoreLabel.hidden = NO;
    
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
    //Fix Me everything between here and if statement should be in Flag class
    NSString *countryWithSpace = [NSString stringWithFormat:@"%@ ",self.flagObject.country];
    
    NSString *lowerUserAnswer = [self.userAnswer lowercaseString];
    
    NSString *lowerAnswer = [self.flagObject.country lowercaseString];
    
    NSString *lowerCountryWithSpace = [countryWithSpace lowercaseString];

    NSString *lowerUserAnswerWithSpace = [NSString stringWithFormat:@"%@ ",lowerUserAnswer];

    if ([lowerAnswer isEqualToString: lowerUserAnswer] || [lowerUserAnswerWithSpace isEqualToString:lowerCountryWithSpace]) {
        
        self.streak += 1;
        
        self.totalCorrectAnswers += 1;
    
        self.correctLabel.text = [NSString stringWithFormat:@"Total Correct: %d", self.totalCorrectAnswers];
        
        self.answerLabel.text = nil;
        
        [self askQuestion];
        
    } else {
        
        [self.incorrectAnswers addObject:self.flagObject];
        
        for (Flag *lower in self.incorrectAnswers){
            NSLog(@"Country = %@",lower.country);
            NSLog(@"Emoji = %@",lower.emoji);
        }
        
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
    
    self.flagObject = [[Flag alloc] init];
    
    [self.flagObject assignCountry];
    
    self.emojiLabel.text = self.flagObject.emoji;
    
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
// create a new app - have it ask 5 traveling questions (random questions, 1-5). All 5 questions should have 4 options, with 1 correct answer. WHen they click the button, tell them if they were wrong or right. Store it if it's wrong. Then - have another button that is "Help", which, when clicked, will tell them which question they've gotten wrong. Will need a custom class for each question, will want question to store and present everything, and use an array to store questions. Also - on the top left of screen, have a running percentage of how many questions they've gotten correct.



@end
