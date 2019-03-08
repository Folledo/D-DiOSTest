//
//  Message.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import Foundation

/* //Message.h
#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSURL *avatarURL;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithTestName:(NSString *)name withTestMessage:(NSString *)message;
@end

*/



/* //Message.m
#import "Message.h"

@implementation Message

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
self = [super init];
if (self)
{
self.userID = dictionary[@"user_id"];
self.username = dictionary[@"username"];
self.avatarURL = [NSURL URLWithString:dictionary[@"avatar_url"]];
self.text = dictionary[@"message"];
}

return self;
}

- (instancetype)initWithTestName:(NSString *)name withTestMessage:(NSString *)message
{
self = [super init];
if (self)
{
self.userID = 0;
self.username = name;
self.avatarURL = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png"];
self.text = message;
}

return self;
}

@end

*/
