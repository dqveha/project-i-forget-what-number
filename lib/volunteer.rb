class Volunteer
  attr_reader :name, :id, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
    @project_id = attributes.fetch(:project_id).to_i
  end

end