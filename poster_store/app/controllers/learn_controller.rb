#Team No:11
#Date of submission: 6/6/2014

# Learn controller handles integration with FbGraph API
class LearnController < ApplicationController
  def index
   #Load facebook.yml info
	 config = YAML::load(File.open("#{Rails.root}/config/facebook.yml"));
		
    #Instantiate a new application with our app_id so we can get an access token
	 
     my_app = FbGraph::Application.new(config['production']['app_id']);
     acc_tok = my_app.get_access_token(config['production']['client_secret']);

    #Instantiate a new page class using the page_id specified - In our case, it is the photographer's Facebook page "WorldInMyLens"
    @page = FbGraph::Page.new(config['production']['page_id'], :access_token => acc_tok).fetch;
	
    #Grab the events from the page 
	
    events = @page.events.sort_by{|e| e.start_time};
    
    #Get the events that are upcoming
    @upcoming_events = events.find_all{|e| e.start_time >= Time.now};

    #Get the events that have passed
    @past_events = events.find_all{|e| e.start_time < Time.now}.reverse;

  end
end
