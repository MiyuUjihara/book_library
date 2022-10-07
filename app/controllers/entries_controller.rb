class EntriesController < ApplicationController

  before_action :set_entry, only: %i[ show edit update destroy ]
  before_action :set_blog, only: %i[ new show edit update destroy ]
  before_action :entry_comments, only: %i[ index show ]

  def index
    @blog = Blog.find(params[:blog_id])
    @entries = Entry.where(blog_id: @blog)
  end

  def show
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to blog_entries_path, notice: "entry was successfully created." }
        format.json { render :show, status: :created, location: @entries }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrys.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to blog_entry_path(@blog, @entry), notice: "entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to blog_entries_path(@blog), notice: "entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def entry_comments
      @comments = Comment.where(status: 'approved', entry_id: @entry)
    end

    def entry_params
      params.require(:entry).permit(:title, :body).merge(blog_id: params[:blog_id])
    end
end
