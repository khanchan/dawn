class Forgery::Dawn < Forgery

  def self.app_name
    [dictionaries[:docker_left].random,
     dictionaries[:docker_right].random,
     rand(100)].join("-")
  end

end