class Api::BaseController < ::ApplicationController
  # before_action :authenticate_user!
  http_basic_authenticate_with name: ENV["API_NAME"], password: ENV["API_PASSWORD"]

end
