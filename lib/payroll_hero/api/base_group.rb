class BaseGroup
  def base_url_for(name)
    PayrollHero::Api.send("#{name}_base_url")
  end
end
