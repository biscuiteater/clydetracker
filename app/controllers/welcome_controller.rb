class WelcomeController < ApplicationController
  def index
    # stories
    @stories_icebox   = Story.find_all_by_section_id(1, :order => "id DESC")
    @stories_backlog  = Story.find_all_by_section_id(2, :order => "id DESC")

    # if it doesnt exist lets create a default one
    Section.create_current_sprint

    @current_sprint   = Section.current_sprint
    @stories_current  = Story.find_all_by_section_id(@current_sprint, :order => "id DESC")

    @previous_sprint  = Section.previous_sprint
    @stories_previous = Story.find_all_by_section_id(@previous_sprint, :order => "id DESC")

    # for select boxes
    @users            = User.find :all, :order => "name"
    @statuses         = Status.find :all, :order => "id ASC"
    @story_types      = StoryType.find :all, :order => "name ASC"
    @sections         = Section.select_box
  end
end
