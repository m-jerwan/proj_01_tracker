require_relative('../db/sqlRunner.rb')

class Tag
attr_reader :id

  def initialize(options)
    @id = options['id']
    @tag_name = options['tag_name']
  end

end
