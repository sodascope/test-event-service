# test-event-service

An example rails api project to save and retrieve events.

### Features:
* Save events to sql database
* Records have org, hostname, description and timestamp
* Retrieve records: all, by org, by hostname, last n-records (all sorted by timestamp)
* Demonstrates use of rails-api
* Demonstrates use of rspec tests

### Installation
* bundle install
* rake db:create
* rake db:migrate
* rails s

### Use
API Status (ping)

	POST: http://0.0.0.0:3000

Create Events

	POST: http://0.0.0.0:3000/events/<org-name>
	json-payload
	{ 
    	"description": "one cool event", 
    	"hostname": "misterYY"
	}

Retrieve All events

	GET: http://0.0.0.0:3000/events
	
Retrieve last 20 events

	http://localhost:3000/events/?n=20

Retrieve last n events from org "dep2"

	GET: http://localhost:3000/events/dep2?n=10
	
Retrieve last n events from org "dep2" with host "misterYY"

	GET: http://localhost:3000/events/dep2/misterYY?n=10
	
Note: all events returned are sorted by creation time


###Run Tests
* bundle exec rspec

###Info
* Ruby v2.3.0
* Rails v5.0
* Rspec v3.5.0
* Coverage

###ToDo
* Deploy to Heroku


