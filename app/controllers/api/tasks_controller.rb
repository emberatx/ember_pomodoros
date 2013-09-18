module Api
  class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    respond_to :json

    # GET /tasks
    # GET /tasks.json
    def index
      @tasks = Task.visible
      respond_with @tasks, root: false
    end

    # GET /tasks/1
    # GET /tasks/1.json
    def show
      respond_with @task, root: false
    end


    # POST /tasks
    # POST /tasks.json
    def create
      @task = Task.new(task_params)

      respond_to do |format|
        if @task.save
          format.json { render json: @task, root: false, status: :created }
        else
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tasks/1
    # PATCH/PUT /tasks/1.json
    def update
      respond_to do |format|
        if @task.update(task_params)
          format.json { render json: @task, root: false }
        else
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tasks/1
    # DELETE /tasks/1.json
    def destroy
      @task.archive!
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def task_params
        params.require(:task).permit(:name, :estimate, :status)
      end
  end
end