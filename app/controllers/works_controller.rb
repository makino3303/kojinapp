class WorksController < ApplicationController
  layout  'devise'

  def new
    @works = Work.new
  end

  def create
    if Work.create(work_params)
      redirect_to '/works/new'
    else
      render '/works/new'
    end
  end

  private

  def work_params
    params.require(:work).permit(
      :title,
      :content,
      :release,
      :starring,
      :image
    )
  end
end
