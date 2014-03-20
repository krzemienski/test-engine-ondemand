module EBU
  # Limit upload size for individual file uploads.
  UPLOAD_MAX_SIZE = 400.megabytes
  UPLOAD_PATH = case Rails.env
  when "production" then "/data_ebs/uploads/:class/:attachment/:id_partition/:style/:filename"
  else ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename"
  end
  # Expire items after 30 days
  MAX_AGE = 30.days
  
  # Timeout setting for communicating with transcoders (in seconds).
  TRANSCODER_TIMEOUT = 5
  
  # Base location for intermediate files generated by ffmpeg / Codem.
  INTERMEDIATE_FILE_LOCATION = case Rails.env
    when 'production' then '/data_ebs/tmp'
    else [Rails.root, 'tmp', 'intermediate'].join(File::SEPARATOR)
  end
  
  # Final location for DASHed files
  FINAL_FILE_LOCATION = case Rails.env
    when 'production' then '/data_ebs/media/dash'
    else [Rails.root, 'public', 'dash'].join(File::SEPARATOR)
  end
  
  # Callback URL for Codem transcoder. Depends on Rails environment and setup.
  CALLBACK_URL_FOR_CODEM = case Rails.env
    when 'development' then 'http://localhost:3000/codem_notifications'
    when 'development_remote' then 'http://localhost:3000/codem_notifications'
    when 'production' then 'http://ebu-ondemand.madebyhiro.com/codem_notifications'
    else raise "Codem callback URL not yet configured."
  end
  
  # Callback URL for http-runner jobs. Depends on Rails environment and setup.
  CALLBACK_URL_FOR_HTTP_RUNNER = case Rails.env
    when 'development' then 'http://localhost:3000/http_runner_notifications'
    when 'development_remote' then 'http://localhost:3000/http_runner_notifications'
    when 'production' then 'http://ebu-ondemand.madebyhiro.com/http_runner_notifications'
    else raise "http-runner callback URL not yet configured."
  end
  
  # http-runner host. Depends on Rails environment and setup.
  HTTP_RUNNER_HOST = case Rails.env
    when 'development' then 'http://localhost:9000'
    when 'development_remote' then 'http://localhost:9000'
    when 'production' then 'http://localhost:9000'
    else raise "http-runner host not yet configured."
  end
  
  CONFORMANCE_ANT_BUILD_FILE = [Rails.root, 'vendor', 'conformance', 'MPDValidator', 'build.xml'].join(File::SEPARATOR)
  #ALLOWED_CONTENT_TYPES = /\Aimage|\Avideo|\Atext/
  
  API_URL = case Rails.env
    when "production" then "http://ebu.io/plugit/#{Rails.application.secrets.plugit}/14"
    else "http://ebu.io/plugit/#{Rails.application.secrets.plugit}/13"
  end
end