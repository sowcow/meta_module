def remove_const *names
  names.each do |name|
    Object.send :remove_const, name rescue nil
  end
end