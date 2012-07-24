require 'tropo-webapi-ruby'
require 'sinatra'
require 'net/http'
require 'net/https'

post '/indexManual.json' do
  currentCall = Tropo::Generator.parse request.env['rack.input'].read
  resp = Tropo::Generator.new
  
  if currentCall.session.call_id.nil?
    # receive the number in the current session
    to = currentCall.session.parameters.to
    
    # Here you can save the status, using the number tu identify a person
    
    resp.message({:to => "+" + to.to_s, :network => "SMS"}) do
      say :value => "Please reply \"Y\" to confirm that this example works."
    end
  else
    from = currentCall.session.from.id
    test = currentCall.session.initial_text

    current_response = "It's working and you say something different that \"Y\""
    
    # Here you can save the status, using the number tu identify a person
    
    if text == "Y" || text == "y"
      current_response = "Yes is working!"
    end
    resp.message({:to => "+" + from.to_s, :network => "SMS"}) do 
      say :value => current_response
    end
  end
  
  resp.response
end

post '/enviar' do
  url = URI.parse('https://api.tropo.com/1.0/sessions')
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  request = Net::HTTP::Get.new(url.path + '?action=create&token=' + params[:token] + '&to=+' + params[:to])
  response = http.start {|http| http.request(request) }

  erb :sent
end

get '/' do
  erb :home
end