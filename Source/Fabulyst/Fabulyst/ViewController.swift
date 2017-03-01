//
//  ViewController.swift
//  Fabulyst
//
//  Created by Vishnu M on 12/09/16.
//  Copyright © 2016 Vishnu M. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
    }
    
    @IBOutlet var LoginButton: FBSDKLoginButton!
 //   let LoginButton: FBSDKLoginButton = {
 //     let button = FBSDKLoginButton()
 //     return button
 //       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
 //       view.addSubview(LoginButton)
 //       LoginButton.center = view.center

        LoginButton.readPermissions = ["public_profile", "email"]
        LoginButton.delegate = self

        if let token = FBSDKAccessToken.currentAccessToken(){

            Extractdata()
        }
                        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
        
    func Extractdata(){
        let headers = [
            "content-type": "multipart/form-data; boundary=---011000010111000001101001",
            "cache-control": "no-cache"
        ]
        let parameters = [
            [
                "name": "provider",
                "value": "facebook"
            ],
            [
                "name": "access_token",
                "value": FBSDKAccessToken.currentAccessToken().tokenString
            ]
        ]
        
        let boundary = "---011000010111000001101001"
        
        let body = NSMutableData()
        for param in parameters {
            let paramName = param["name"]!
            body.appendData("--\(boundary)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            body.appendData("Content-Disposition:form-data; name=\"\(paramName)\"".dataUsingEncoding(NSUTF8StringEncoding)!)
            if let paramValue = param["value"] {
                body.appendData("\r\n\r\n\(paramValue)".dataUsingEncoding(NSUTF8StringEncoding)!)
            }
        }
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://www.fabulyst.com/accounts/api/v1/social_login/")!,
                                          cachePolicy: .UseProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.HTTPMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.HTTPBody = body
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? NSHTTPURLResponse
                print(httpResponse)
 //               print(logindata)
            }
        })
        
        dataTask.resume()
        
        print("Extracting Data")
        let parameterlist = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameterlist).startWithCompletionHandler { (connection,result,error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            print(FBSDKAccessToken.currentAccessToken().tokenString)
            if let email = result["email"] as? String {
                print(result["first_name"] as? String)
                print(email)
            }
        }
        
        
    }
    

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("Logged in")
        if let token = FBSDKAccessToken.currentAccessToken(){
            Extractdata()
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

