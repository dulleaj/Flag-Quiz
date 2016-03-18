//
//  Flag.h
//  Emoji
//
//  Created by Andrew Dulle on 3/8/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject;

@property NSString *country;

@property NSString *emoji;

@property NSString *capital;

- (void) assignCountry;

@end