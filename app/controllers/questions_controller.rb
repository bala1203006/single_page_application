class QuestionsController < ApplicationController

	#show the actual view of the index page
	def index
		@questions = Question.includes(:role, :mapping).order(id: :desc).paginate(page: params[:page], per_page: 10)
	end

  #render new page for question form
  def new
   	@question = Question.new
  end 

  #create question in the database
  def create
   	@question = Question.new(question_params)
   	is_saved = @question.save
   	if is_saved
   		respond_to do |format|
   			format.json { redirect_to root_path, notice: 'Question has been created successfully.' }
   		end	
   	end	
  end 

  #show particular question from the database
	def show
		@question = Question.find_by_id(params[:id])
	end

  #edit the form with prefilled data
	def edit
		@question = Question.find_by_id(params[:id])
	end

  #update the question object in the database
	def update
   	@question = Question.find_by_id(params[:id])
   	is_saved = @question.update(question_params)
   	if is_saved
   		respond_to do |format|
   			format.json { redirect_to root_path, notice: 'Question has been updated successfully.' }
   		end	
   	end			
	end

  #destroy the question object from the database
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
