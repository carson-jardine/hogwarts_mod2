require 'rails_helper'

describe "As a visitor" do
  before :each do
    @mcgonagall = Professor.create!(
                  name: "Minerva McGonagall",
                  age: 204,
                  specialty: "Transfiguration")
    @snape = Professor.create!(
                  name: "Severus Snape",
                  age: 40,
                  specialty: "Potions")

    @longbottom = Student.create!(
      name: "Neville Longbottom",
      age: 14,
      house: "Gryffindor")
    @malfoy = Student.create!(
      name: "Draco Malfoy",
      age: 12,
      house: "Slytherin")
    @potter = Student.create!(
      name: "Harry Potter",
      age: 13,
      house: "Gryffindor")
    ProfessorStudent.create!(professor: @mcgonagall, student: @longbottom)
    ProfessorStudent.create!(professor: @mcgonagall, student: @potter)
    ProfessorStudent.create!(professor: @snape, student: @malfoy)
    ProfessorStudent.create!(professor: @snape, student: @longbottom)
  end

  describe 'When I visit a professors show page' do
    it "Shows a list of students the professor has" do
      visit "/professors/#{@mcgonagall.id}"

      expect(page).to have_content("#{@longbottom.name}")
      expect(page).to have_content("#{@potter.name}")
      expect(page).to_not have_content("#{@malfoy.name}")
    end
  end

end