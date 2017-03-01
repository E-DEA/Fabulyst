// NOTE : This is for Swift 2.2
//Assuming all necessary modules have been imported into the main controller of the application.
//Eg: Import Foundation, Import UIKit etc.
//Code:
let Endpoint: String = "http://www.fabulyst.com/accounts/api/v1/social_login/"
guard let todoURL = NSURL(string: Endpoint) else {
	print("Error: cannot create URL")
	return
}
let todoUrlRequest = NSMutableURLRequest(URL: todoURL)
todoUrlRequest.HTTPMethod = "POST"
let newTodo: NSDictionary = ["provider": "facebook", "access_token": /*Insert FBSDKAccessToken value here*/]
let jsonTodo: NSData
do {
	jsonTodo = try NSJSONSerialization.dataWithJSONObject(newTodo, options: [])
	todoUrlRequest.HTTPBody = jsonTodo
	} catch {
		print("Error: cannot create JSON from todo")
		return
	}
	todoUrlRequest.HTTPBody = jsonTodo

	let session = NSURLSession()

	let task = session.dataTaskWithRequest(todoUrlRequest) {
		(data, response, error) in
		guard let responseData = data else {
			print("Error: did not receive data")
			return
		}
		guard error == nil else {
			print("error calling POST on /todos/1")
			print(error)
			return
		}
		
		// parse the result as JSON, since that's what the API provides
		do {
			guard let receivedTodo = try NSJSONSerialization.JSONObjectWithData(responseData,
				options: []) as? [String: AnyObject] else {
				print("Could not get JSON from responseData as dictionary")
				return
			}
    /*******
    Now, the output of POST/GET request is saved in the dictionary recievedTodo.
    Useful Keys are:
    "token" - which is to be used in further GET requests to get data about user and all the dresses and their information accordingly.
    "email", "name", "image" - URL to the facebook profile picture, "fb_url" - URL to facebook profile of user.
    *********/
    //Example to test whether any information is recieved associated with that key:
    //guard let todoID = receivedTodo["id"] as? Int else {
    	//  print("Could not get todoID as int from JSON")
    	//  return
    	//}
    	//print("The ID is: \(todoID)")
    	} catch  {
    		print("error parsing response from POST request")
    		return
    	}
    }
    task.resume()