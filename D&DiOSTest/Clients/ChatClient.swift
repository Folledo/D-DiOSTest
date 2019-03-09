//
//  ChatClient.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import Foundation
import UIKit

class ChatClient: NSObject {
	
	var session: URLSession?
	
	
//fetchChatData
	class func fetchChatData(_ completion: @escaping ([Message]?) -> Void, withError errorBlock: @escaping (_ error: String?) -> Void) {
		var fetchedMessages = [Message]()
		let url = URL(string: "http://dev.datechnologies.co/Tests/scripts/chat_log.php")!
		let request = NSMutableURLRequest(url: url)
		
		let task = URLSession.shared.dataTask(with: request as URLRequest) {
			data, response, error in
			if let error = error {
				errorBlock(error.localizedDescription)
			} else { //if no error
				if let urlContent = data {
					do {
						let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject //to actually see the URL codes
						if let messages = jsonResult["data"] as? NSArray {
							for message in messages as [AnyObject] {
								
								guard let userID = message["user_id"] as? String, let userName = message["name"] as? String, let avatarURL = message["avatar_url"] as? String, let text = message["message"] as? String else { print("missing some parts of message"); return }
//								print("userID is \(userID)\nname is \(userName)\navatarURL is \(avatarURL)\nmessage is \(text)\n\n\n")
								fetchedMessages.append(Message(_userID: userID, _userName: userName, _avatarURL: URL(string: avatarURL)!, _text: text))
							}
							completion(fetchedMessages)
						}
					} catch let parseError {
						errorBlock(parseError.localizedDescription)
					}
				}
			}
		}
		task.resume()
		
	}
}

/*
//ChatClient.h
#import <Foundation/Foundation.h>
#import "Message.h"

@interface ChatClient : NSObject
- (void)fetchChatData:(void (^)(NSArray<Message *> *))completion withError:(void (^)(NSString *error))errorBlock;
@end
*/

/*
//ChatClient.m
#import "ChatClient.h"

@interface ChatClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ChatClient

/**
* =========================================================================================
* INSTRUCTIONS
* =========================================================================================
* 1) Make a request to fetch chat data used in this app.
*
* 2) Using the following endpoint, make a request to fetch data
*    URL: http://dev.datechnologies.co/Tests/scripts/chat_log.php
**/

- (void)fetchChatData:(void (^)(NSArray<Message *> *))completion withError:(void (^)(NSString *error))errorBlock
{
	
}

@end
*/
