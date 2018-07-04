class ExcerptsController < ApplicationController
  def search
    @query = params["q"]
    @match_case = params["matchcase"] == "true" ? true : false
    @results = {}
    @excerpts = []

    if @match_case == true
      @excerpts = Excerpt.includes(:publication).where("text LIKE ?", "%#{@query}%")
    else
      @excerpts = Excerpt.includes(:publication).where("upper(text) LIKE ?", "%#{@query.upcase}%")
    end

    @excerpts.each do |excerpt|
      # I messed up the database here, didn't I? The 'title' and 'publication number' are two different things. -_-
      pub_number = excerpt.publication.pub_number
      page = excerpt.page_number
      blurb = excerpt.text.match /\b.{0,50}#{@query}.{0,50}\b/i
      puts "BLURB: #{blurb} on PAGE: #{page}"
      short_exc = {page_number: page, text: blurb.to_s}
      @results[pub_number] = @results[pub_number] ? @results[pub_number].push(short_exc) : [short_exc]
    end

    if @excerpts.length == 0
      @results["No results found"] = ["No results"]
    end

    # What I want to do now is turn all of this into an array instead of an object, which will mean
    # refactoring the search interface, but it will be a lot cleaner of code in the end.


    render json: @results.to_json
  end
end
