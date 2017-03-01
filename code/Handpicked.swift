// NOTE : This is for Swift 2.2
//Assuming all necessary modules have been imported into the main controller of the application.
//Eg: Import Foundation, Import UIKit etc.
//Code:
let todoEndpoint: String = "http://www.fabulyst.com/card/api/v2/cards/"
guard let url = NSURL(string: todoEndpoint) else {
	print("Error: cannot create URL")
	return
}
let urlRequest = NSMutableURLRequest(URL: url)
urlRequest.setValue("Token" /*Token value here [obtained on login]*/, forHTTPHeaderField: "Authorization")

urlRequest.HTTPMethod = "GET"

let config = NSURLSessionConfiguration.defaultSessionConfiguration()
let session = NSURLSession(configuration: config)

let task = session.dataTaskWithRequest(urlRequest) {
	(data, response, error) in
	guard let responseData = data else {
		print("Error: did not receive data")
		return
	}
	guard error == nil else {
		print("error calling GET request")
		print(error)
		return
	}
	// parse the result as JSON, since that's what the API provides
	do {
		guard let todo = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as? [String: AnyObject] else {
			// TODO: handle
			print("Couldn't convert received data to JSON dictionary")
			return
		}
    /*******
    Now, the output of POST/GET request is saved in the dictionary recievedTodo.
    Useful Keys are:
    "product" - Associated with a dictionary of information regading the product.
    "affiliate_link" - Link to be redirected when buy button is pressed.
    "sellingPrice" - Price of the dress after discount.
    "price" - Price before discount.
    
    *********/
    //Example to test whether any information is recieved associated with that key:
    //guard let todoID = receivedTodo["id"] as? Int else {
    	//  print("Could not get todoID as int from JSON")
    	//  return
    	//}
    	//print("The ID is: \(todoID)")
    	}catch  {
    		print("error trying to convert data to JSON")
    	}
    }
    task.resume()