class LogAnalyzer

  def log_break_down(file)
  	File.open(file).read.split
  end
  
  def get_names_array(file)
  	name_array = log_break_down(file).select {|phrase| phrase[0] == "/" }
  end

  def get_ip_array(file)
  	ip_array = log_break_down(file).select {|phrase| phrase.start_with?(/\d{3}./)}
  end
 
  def list_of_sites(file)
  	list = get_names_array(file).uniq
  end 
 
end
