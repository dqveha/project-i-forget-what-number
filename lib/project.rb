class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save()
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(project_to_compare)
    (self.title() == project_to_compare.title())
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = returned_projects.map() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      Project.new({:title => title, :id => id})
    end
    projects
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      id = project.fetch("id").to_i
      title = project.fetch("title")
      Project.new({:title => title, :id => id})
    else
      false
    end
  end
  
  def update(title)
    @title = title
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("UPDATE volunteers SET project_id 'nil' WHERE id = #{@id};")
  end

  def volunteers
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
    volunteers = results.map() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i()
      id = volunteer.fetch("id").to_i()
      Volunteer.new({:name => name, :project_id => project_id, :id => id})
    end
    volunteers
  end
end
