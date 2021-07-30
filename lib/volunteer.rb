class Volunteer
  attr_reader :name, :id, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
    @project_id = attributes.fetch(:project_id).to_i
  end

  def ==(volunteer_to_compare)
    (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id())
  end

  def save()
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.all()
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = returned_volunteers.map() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      project_id = volunteer.fetch("project_id")
      Volunteer.new({:name => name, :id => id, :project_id => project_id})
    end
    volunteers
  end

end