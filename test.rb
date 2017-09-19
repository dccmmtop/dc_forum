def source_for(object, method_sym)
  if object.respond_to?(method_sym, true)
    method = object.method(method_sym)
  elsif object.is_a?(Module)
    method = object.instance_method(method_sym)
  end
  location = method.source_location
  # `mvim #{location[0]} +#{location[1]}` if location
  p location
rescue
  nil
end

source_for("123",:size)