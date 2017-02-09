class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path
    else
      render :new
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    { time: parse_time }
  end

  def permit_params
    params.require(:schedule).permit('time(4i)', 'time(5i)')
  end

  def parse_time
    Time.new(2000,1,1,permit_params['time(4i)'], permit_params['time(5i)'])
  end
end
