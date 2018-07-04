class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def search
    # Once authentication/authorization is setup, this will be a key place 
    # to perhaps ask, "is this your library? are you allowed to search here?"

    # 1. Grab library
    # 2. Make a copy of the keys with blanks and certain not needed ones removed
    # 3. Build up an sql query that can have values injected into it
    # 4. Collect an array of the values from the param_keys
    # 5. Query the database with this sql, with the values using the splat operator
    #    to spread the values in the same order they were in the query
    # 6. Return the results of that so the search ui can build a table.
    @library = Library.find(params[:library_id])
    @param_keys = params.keys.delete_if { |key| 
      params[key].to_s == "" || params[key].length == 0 || key == "controller" || key == "action" || key == "library_id"
    }
    # sql = ""
    # @param_keys.each do |key|
    #   chunk = ""
    #   if key.class == Array
    #     chunk = " IN (" + '?'
    #   sql += (sql.length == 0 ? key + " LIKE ? " : "AND #{key} LIKE ? ")
      
    # end
    # @values = @param_keys.collect {|key| "%#{params[key].upcase}%" }
    
    # @entries = @library.entries.where(sql, *@values)
    @entries = []
    @param_keys.each do |key|
        puts key, params[key]
        if @entries == []
          @entries = Entry.where("#{key}": params[key])
        else
          @entries = @entries.where("#{key}": params[key])
        end
    end
    

    render json: @entries.as_json
  end
end
