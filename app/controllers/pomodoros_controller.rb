class PomodorosController < ApplicationController
  before_action :set_task
  before_action :set_pomodoro, only: [:show, :edit, :update, :destroy]

  # GET /pomodoros
  # GET /pomodoros.json
  def index
    @pomodoros = Pomodoro.all
  end

  # GET /pomodoros/1
  # GET /pomodoros/1.json
  def show
  end

  # GET /pomodoros/new
  def new
    @pomodoro = @task.pomodoros.new
  end

  # GET /pomodoros/1/edit
  def edit
  end

  # POST /pomodoros
  # POST /pomodoros.json
  def create
    @pomodoro = @task.pomodoros.new(pomodoro_params)

    respond_to do |format|
      if @pomodoro.save
        format.html { redirect_to [@task, @pomodoro], notice: 'Pomodoro was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@task, @pomodoro] }
      else
        format.html { render action: 'new' }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pomodoros/1
  # PATCH/PUT /pomodoros/1.json
  def update
    respond_to do |format|
      if @pomodoro.update(pomodoro_params)
        format.html { redirect_to [@task, @pomodoro], notice: 'Pomodoro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pomodoros/1
  # DELETE /pomodoros/1.json
  def destroy
    @pomodoro.destroy
    respond_to do |format|
      format.html { redirect_to task_pomodoros_url(@task) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pomodoro
      set_task
      @pomodoro = @task.pomodoros.find(params[:id])
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pomodoro_params
      params.require(:pomodoro).permit(:status, :task_id, :started_at, :completed_at)
    end
end
