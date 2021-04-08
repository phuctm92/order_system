class BaseService
  def self.call(**args)
    new.call(**args)
  end

  def success(**arg)
    { status: :success }.merge(arg)
  end

  def error(**arg)
    { status: :error }.merge(arg)
  end
end