class CommentsController < ApplicationController

  before_action :set_blog
  before_action :set_entry
  before_action :set_comment, only: %i[show edit update destroy approved unapproved]

  def index
    @comments = Comment.where(entry_id: params[:entry_id])
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_entry_comment_path(@blog, @entry, @comment), notice: "comment was successfully created." }
        format.json { render :show, status: :created, location: @comments }
        NoticeMailer.notice_comment(@blog, @entry, @comment).deliver
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comments.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to blog_entry_comment_path(@blog, @entry, @comment), notice: "comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comments }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comments.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to blog_entry_comments_path(@blog, @entry), notice: "entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def approved
    respond_to do |format|
      if @comment.update(status: "approved")
        format.html { redirect_to blog_entry_comments_path(@blog, @entry), notice: "comment was successfully approved." }
        format.json { render :index, status: :ok, location: @comments }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @comments.errors, status: :unprocessable_entity }
      end
    end
  end

  def unapproved
    respond_to do |format|
      if @comment.update(status: "unapproved")
        format.html { redirect_to blog_entry_comments_path(@blog, @entry), notice: "comment was successfully unapproved." }
        format.json { render :index, status: :ok, location: @comments }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @comments.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status).merge(entry_id: params[:entry_id])
  end

end
