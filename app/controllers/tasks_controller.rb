class TasksController < ApplicationController

    before_action :find_task, only: [:show, :destroy, :update]

    def index 
        render json: Task.all
    end

    def show

        render json: @task

    end

    def create
        task = Task.create!(task_params)
        render json: task, status: :created
    end

    def destroy
        @task.destroy
        head :no_content
    end

    def update
        @task.update!(task_params)
        render json: @task
    end

    private

        def find_task

            @task = Task.find(params[:id])

        end

        def task_params
            params.permit(:id, :description, :xp_amount, :user_id, :category_id, :ranking, :category, category_attributes: [:id, :name])
        end
end
