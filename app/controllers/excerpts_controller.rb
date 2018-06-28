class ExcerptsController < ApplicationController
  def search
    @query = params["q"]
    @match_case = params["matchcase"] == "true" ? true : false
    puts "MATCH CASE EVALUATED TO: ", @match_case
    @results = {}

    if @match_case == true
      excerpts = Excerpt.includes(:publication).where("text LIKE ?", "%#{@query}%")
    else
      @query = @query.upcase
      excerpts = Excerpt.includes(:publication).where("upper(text) LIKE ?", "%#{@query}%")
    end

    excerpts.each do |excerpt|
      title = excerpt.publication.title
      page = excerpt.page_number
      blurb = excerpt.text.match /\b.{0,50}#{@query}.{0,50}\b/
      short_exc = {page_number: page, text: blurb.to_s}
      @results[title] = @results[title] ? @results[title].push(short_exc) : [short_exc]
    end
    if excerpts.length == 0
      @results["No results found"] = ["No results"]
    end
    render json: @results.to_json
  end
end
