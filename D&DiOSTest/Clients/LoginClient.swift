//
//  LoginClient.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import Foundation

class LoginClient: NSObject {
	private var session: URLSession?
	
	/**
	* =========================================================================================
	* INSTRUCTIONS
	* =========================================================================================
	* 1) Make a request here to login.
	*
	* 2) Using the following endpoint, make a request to login
	*    URL: http://dev.datechnologies.co/Tests/scripts/login.php
	*
	* 3) Don't forget, the endpoint takes two parameters 'username' and 'password'
	*
	* 4) A valid email is 'info@datechnologies.co'
	*    A valid password is 'Test123'
	**/
	class func login(withUsername username: String?, password: String?, completion: @escaping ([String : String]?) -> Void) {
		
		let url = URL(string: "http://dev.datechnologies.co/Tests/scripts/login.php")!
		let request = NSMutableURLRequest(url: url)
		
		let task = URLSession.shared.dataTask(with: request as URLRequest) {
			data, response, error in
			if error != nil {
				print(error!.localizedDescription)
				return
			} else { //if no error
				if let urlContent = data {
					do {
						let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject //to actually see the URL codes
//						print(jsonResult)
						let code = jsonResult["code"]
						let message = jsonResult["message"]
						
						let result = ["code": code, "message": message]

						
						completion(result as? [String : String])

					} catch {
						completion(nil)
					}
				}
			}
		}
		task.resume()
		
	}
}




/* LoginClient.h
#import <Foundation/Foundation.h>

@interface LoginClient : NSObject
- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(NSDictionary *))completion;
@end

*/

/* LoginClient.m
#import "LoginClient.h"

@interface LoginClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation LoginClient

/**
* =========================================================================================
* INSTRUCTIONS
* =========================================================================================
* 1) Make a request here to login.
*
* 2) Using the following endpoint, make a request to login
*    URL: http://dev.datechnologies.co/Tests/scripts/login.php
*
* 3) Don't forget, the endpoint takes two parameters 'username' and 'password'
*
* 4) A valid email is 'info@datechnologies.co'
*    A valid password is 'Test123'
**/

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(NSDictionary *))completion
{

}

@end

*/
