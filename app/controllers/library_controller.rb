class LibraryController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @library = Library.find(params[:id])
    render json: @library.as_json(except: [:created_at, :updated_at])
  end
end
