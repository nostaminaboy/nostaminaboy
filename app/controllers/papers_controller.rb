class PapersController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
    
    def index
      if params[:search].present?
        search = params[:search]
        @papers = Paper.joins(:user).where("title LIKE ? OR author LIKE ? OR year LIKE ? OR journal LIKE ? OR purpose LIKE ? OR method LIKE ? OR result LIKE ? " , "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @papers = Paper.all
      end
        @papers = @papers.page(params[:page]).per(3)
    end

    def new
        @paper=Paper.new
    end

    def create
        paper = Paper.new(paper_params)
        paper.user_id = current_user.id
        if paper.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @paper = Paper.find(params[:id])
    end

    def edit
        @paper = Paper.find(params[:id])
    end

    def update
        paper = Paper.find(params[:id])
        if paper.update(paper_params)
          redirect_to :action => "show", :id => paper.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        paper = Paper.find(params[:id])
        paper.destroy
        redirect_to action: :index
    end

    private
    def paper_params
      params.require(:paper).permit(:name, :title, :author, :year, :journal, :subject, :purpose, :method, :result)
    end

end
