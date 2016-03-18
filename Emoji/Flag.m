//
//  Flag.m
//  Emoji
//
//  Created by Andrew Dulle on 3/8/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "Flag.h"

@implementation Flag

- (void) assignCountry {

    int emojiInt = arc4random_uniform(11);
    
    if (emojiInt == 0) {
        
        self.emoji = @"🇩🇪";//Germany
        self.country = @"GERMANY";
        
    }else if (emojiInt == 1) {
        
        self.emoji = @"🇫🇷";//France
        self.country = @"FRANCE";
        
    }else if (emojiInt == 2) {
        
        self.emoji = @"🇨🇭";//Switzerland
        self.country = @"SWITZERLAND";
        
    }else if (emojiInt == 3) {
        
        self.emoji = @"🇧🇷";//Brazil
        self.country = @"BRAZIL";
        
    }else if (emojiInt == 4) {
        
        self.emoji = @"🇬🇷";//Greece
        self.country = @"GREECE";
        
    }else if (emojiInt == 5) {
        
        self.emoji = @"🇧🇪";//Belgium
        self.country = @"BELGIUM";
    }else if (emojiInt == 6) {
        
        self.emoji = @"🇯🇵";//Japan
        self.country = @"JAPAN";
    }else if (emojiInt == 7) {
        
        self.emoji = @"🇳🇱";//Netherlands
        self.country = @"NETHERLANDS";
    }else if (emojiInt == 8) {
        
        self.emoji = @"🇦🇺";//Australia
        self.country = @"AUSTRALIA";
    }else if (emojiInt == 9) {
        
        self.emoji = @"🇨🇦";//Canada
        self.country = @"CANADA";
    }else if (emojiInt == 10) {
        
        self.emoji = @"🇺🇸";//United States of America
        self.country = @"USA";
        
    }else if (emojiInt == 11) {
        
        self.emoji = @"🇮🇹";//Italy
        self.country = @"ITALY";
        
    }else if (emojiInt == 12) {
        
        self.emoji = @"🇵🇪";//Peru
        self.country = @"PERU";
        
    }else if (emojiInt == 13) {
        
        self.emoji = @"🇹🇷";//Turkey
        self.country = @"TURKEY";
        
    }else if (emojiInt == 14) {
        
        self.emoji = @"🇳🇴";//Norway
        self.country = @"NORWAY";
        
    }else if (emojiInt == 15) {
        
        self.emoji = @"🇨🇱";//Chile
        self.country = @"CHILE";
        
    }else if (emojiInt == 16) {
        
        self.emoji = @"🇩🇰";//Denmark
        self.country = @"DENMARK";
        
    }else if (emojiInt == 17) {
        
        self.emoji = @"🇨🇳";//China
        self.country = @"CHINA";
        
    }else if (emojiInt == 18) {
        
        self.emoji = @"🇨🇺";//Cuba
        self.country = @"CUBA";
        
    }else if (emojiInt == 19) {
        
        self.emoji = @"🇫🇮";//Finland
        self.country = @"FINLAND";
        
    }else if (emojiInt == 20) {
        
        self.emoji = @"🇬🇪";//Georgia
        self.country = @"GEORGIA";
        
    }else if (emojiInt == 21) {
        
        self.emoji = @"🇲🇽";//Mexico
        self.country = @"MEXICO";
        
    }
    
}

@end
