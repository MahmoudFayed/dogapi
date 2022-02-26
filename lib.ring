load "libcurl.ring"
load "jsonlib.ring"

func _getrequest(endpoint)
	curl = curl_easy_init()
	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
	curl_easy_setopt(curl, CURLOPT_URL, "https://dog.ceo/api/" + endpoint)

	response = curl_easy_perform_silent(curl)
	curl_easy_cleanup(curl)
	return response

/*
DISPLAY SINGLE RANDOM IMAGE FROM ALL DOGS COLLECTION

Returns a random dog image
*/
func randomimage()
	response = _getrequest("breeds/image/random")
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
DISPLAY MULTIPLE RANDOM IMAGES FROM ALL DOGS COLLECTION

* `imagesNumber` number of images

*NOTE* ~ Max number returned is 50

Return multiple random dog image
*/
func multiple_randomimages(imagesNumber)
	response = _getrequest("breeds/image/random/" + imagesNumber)
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
RANDOM IMAGE FROM A BREED COLLECTION

* `breed` breed name

Returns a random dog image from a breed, e.g. hound
*/
func randomimage_bybreed(breed)
	if len(breed) = 0
		raise("breed can't be empty")
	end
	response = _getrequest("breed/" + breed + "/images/random")
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
MULTIPLE IMAGES FROM A BREED COLLECTION

* `breed` breed name
* `imagesNumber` number of images

Return multiple random dog image from a breed, e.g. hound
*/
func multiple_randomimages_bybreed(breed, imagesNumber)
	if len(breed) = 0
		raise("breed can't be empty")
	end
	response = _getrequest("breed/" + breed +"/images/random/" + imagesNumber)
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
ALL IMAGES FROM A BREED COLLECTION

* `breed` breed name

Returns array of all the images from a breed, e.g. hound
*/
func imagesbybreed(breed)
	if len(breed) = 0
		raise("breed can't be empty")
	end
	response = _getrequest("breed/" + breed +"/images")
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
SINGLE RANDOM IMAGE FROM A SUB BREED COLLECTION

* `breed` breed name
* `subBreed` sub_breed name

Returns a random dog image from a sub-breed, e.g. Afghan Hound
*/
func randomimage_bysubbreed(breed, subBreed)
	if len(breed) = 0
		raise("breed can't be empty")
	end
	if len(subBreed) = 0
		raise("sub breed can't be empty")
	end
	response = _getrequest("breed/" + breed + "/" + subBreed  +"/images/random")
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
MULTIPLE IMAGES FROM A SUB-BREED COLLECTION

* `breed` breed name
* `subBreed` sub_breed name
* `imagesNumber` number of images

Return multiple random dog images from a sub-breed, e.g. Afghan Hound
*/
func multiple_randomimages_bysubbreed(breed, subBreed, imagesNumber)
	if len(breed) = 0
		raise("breed can't be empty")
	end
	if len(subBreed) = 0
		raise("sub breed can't be empty")
	end
	response = _getrequest("breed/" + breed + "/" + subBreed +"/images/random/" + imagesNumber)
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
LIST ALL SUB-BREED IMAGES

* `breed` breed name
* `subBreed` sub_breed name

Returns array of all the images from the sub-breed
*/
func imagesbysubbreed(breed, subBreed)
	if len(breed) = 0
		raise("breed can't be empty")
	end
	if len(subBreed) = 0
		raise("sub breed can't be empty")
	end
	response = _getrequest("breed/" + breed + "/"+ subBreed +"/images")
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
LIST ALL BREEDS

Returns lsit of all the breeds as keys and sub-breeds as values if it has
*/
func breedslist()
	response = _getrequest("breeds/list/all")
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	return json["message"]

/*
LIST ALL SUB-BREEDS

* `breed` breed name

Returns array of all the sub-breeds from a breed if it has sub-breeds
*/
func subbreedslist(breed)
	if len(breed) = 0
		raise("breed can't be empty")
	end
	response = _getrequest("breed/"+ breed +"/list")
	json = Json2List(response)
	if strcmp(json["status"], "success")
		raise(json["message"])
	end
	if len(json["message"]) = 0
		raise("the breed does not have sub-breeds")
	end
	return json["message"]
