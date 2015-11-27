module Configuration
  def configure
    yield self
  end

  def define_setting(name, default = nil)
    class_variable_set("@@#{name}", default)
    define_singleton_method "#{name}=" do |value|
      class_variable_set("@@#{name}", value)
    end
    define_singleton_method name do
      raise("#{name} is not configured") unless class_variable_defined?("@@#{name}")
      class_variable_get("@@#{name}")
    end
  end
end
