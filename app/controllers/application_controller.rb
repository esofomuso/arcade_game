class ApplicationController < ActionController::Base
  protect_from_forgery
  
  decent_configuration do
    strategy DecentExposure::ActiveRecordStrategy
  end
end
