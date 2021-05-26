class QuestionsController < ApplicationController
	def index
		@questions = Question.includes(:role, :mapping).order(id: :desc).paginate(page: params[:page], per_page: 10)
	end
  
  def new
   	@question = Question.new
  end 

  def create
   	@question = Question.new(question_params)
   	@is_saved = @question.save
   	if @is_saved
   		respond_to do |format|
   			format.json { redirect_to root_path, notice: 'Questions has been created successfully.' }
   		end	
   	end	
  end 

	def show
		@question = Question.find_by_id(params[:id])
	end

	def edit
		@question = Question.find_by_id(params[:id])
	end

	def update
   	@question = Question.find_by_id(params[:id])
   	@is_saved = @question.update(question_params)
   	if @is_saved
   		respond_to do |format|
   			format.json { redirect_to root_path, notice: 'Questions has been updated successfully.' }
   		end	
   	end			
	end

	def destroy
		@question = Question.find_by_id(params[:id])		
		if @question.destroy
			notice = 'Question has been removed successfully.'
		else
			notice = 'Unable to perform the requested actions'	
		end
		redirect_to root_path, notice: notice	
	end

	private

	def question_params
		params.require(:question).permit(:body, :role_id, :mapping_id)
	end
end
