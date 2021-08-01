require "spec_helper"

describe Volunteer do
  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(test_volunteer.name).to eq 'Jane'
    end
  end

  describe '#project_id' do
    it 'returns the project_id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(test_volunteer.project_id).to eq 1
    end
  end

  describe '#==' do
    it 'checks for equality based on the name of a volunteer' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer2 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(volunteer1 == volunteer2).to eq true
    end
  end

  describe '#save' do
    it 'adds a volunteer to the database' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      expect(Volunteer.all).to eq [volunteer1]
    end
  end

  context '.all' do
    it 'is empty to start' do
      expect(Volunteer.all).to eq []
    end

    it 'returns all volunteers' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
      volunteer2.save
      expect(Volunteer.all).to eq [volunteer1, volunteer2]
    end
  end

  describe '.find' do
    it 'returns a volunteer by id' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
      volunteer2.save
      expect(Volunteer.find(volunteer1.id)).to eq volunteer1
    end
  end

  describe '#remove' do
    it 'removes a volunteer by id' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
      volunteer2.save
      volunteer1.remove()
      expect(Volunteer.all).to eq [volunteer2]
    end
  end

  describe '#assign_project' do
    it 'updates/assigns project to volunteer' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 2, :id => nil})
      volunteer1.save
      volunteer1.assign_project(1)
      expect(volunteer1.project_id).to eq 1
    end
  end

  describe '.search' do
    it 'searches through the projects table and returns output of top 3 ranks' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 7, :id => nil})
      volunteer2.save
      volunteer3 = Volunteer.new({:name => 'Jill', :project_id => 3, :id => nil})
      volunteer3.save
      volunteer4 = Volunteer.new({:name => 'Jam', :project_id => 7, :id => nil})
      volunteer4.save
      volunteer5 = Volunteer.new({:name => 'Jaws', :project_id => 5, :id => nil})
      volunteer5.save
      volunteer6 = Volunteer.new({:name => 'Jelly', :project_id => 2, :id => nil})
      volunteer6.save
      expect(Volunteer.search("ja")).to eq [volunteer1, volunteer4, volunteer5] 
    end
  end
end
