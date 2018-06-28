class PartNumbersController < ApplicationController
  def search
    @query = params["q"]
    puts "LOOK FOR ME"
    puts @query
    @part_numbers = PartNumber.where(number: @query.split("\n")).includes(:publication)
    render json: @part_numbers, include: {publication: {only: [:title, :path, :maintenance_level]}}
  end
end
