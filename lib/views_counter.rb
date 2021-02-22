require_relative "log_analyzer"

class Counter
  
  def initialize(file)
  	@log_array = LogAnalyzer.new.log_break_down(file)
  	@name_array = LogAnalyzer.new.get_names_array(file)
  	@ip_array = LogAnalyzer.new.get_ip_array(file)
  	@list_of_sites = LogAnalyzer.new.list_of_sites(file)
  end

  def empty_logs
    @log_array.empty?
  end

  def count_views
    return "file is empty" if empty_logs
      
    views = {}
    @list_of_sites.each {|page| views[page] = @name_array.count(page) }

    views.sort_by { |_k, v| -v }.to_h
  
  end

  def count_unique_views
    return "file is empty" if empty_logs

      unique_views = {}
   
      pairs = @name_array.zip(@ip_array)
      name_array = pairs.uniq.flatten.reject {|phrase| phrase.start_with?(/\d{3}./)}

      @list_of_sites.each {|page| unique_views[page] = name_array.count(page) }

      unique_views.sort_by { |_k, v| -v }.to_h
    
  end

end
