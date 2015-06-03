#Author: mr
#Description: small service to generate and destroy security token. 

require 'opentox-server'

module OpenTox
  class Application < Service

    before do
      @accept = request.env['HTTP_ACCEPT']
      response['Content-Type'] = @accept
      puts SERVICE
    end

    post "/#{SERVICE}/authenticate/?" do
      mime_types = ["text/plain"]
      bad_request_error "Mime type #{@accept} not supported here. Please request data as  #{mime_types.join(', ')}." unless mime_types.include? @accept
      bad_request_error "Please send formdata username." unless params[:username]
      bad_request_error "Please send formdata password." unless params[:password]
      case @accept
      when "text/plain"
        if OpenTox::Authorization.authenticate(params[:username], params[:password])
          return OpenTox::RestClientWrapper.subjectid
        else
          return nil
        end
      else
        bad_request_error "'#{@accept}' is not a supported content type."
       end
    end
    
    post "/#{SERVICE}/logout/?" do
      mime_types = ["text/plain"]
      bad_request_error "Mime type #{@accept} not supported here. Please request data as  #{mime_types.join(', ')}." unless mime_types.include? @accept
      bad_request_error "Please send formdata subjectid." unless params[:subjectid]
      case @accept
      when "text/plain"
        if OpenTox::Authorization.logout(params[:subjectid])
          return "Successfully logged out. \n"
        else
          return "Logout failed.\n"
        end
      else
        bad_request_error "'#{@accept}' is not a supported content type."
       end
    end
  end
end