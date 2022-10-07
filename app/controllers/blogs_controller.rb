class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :set_data, only: %i[ index ]
  def index
    respond_to do |format|
      format.html
      format.csv do
        @filename = "ブログ一覧.csv"
        @output_encoding = 'Shift_JIS'
      end
    end
  end

  def show
    @blog = Blog.where("id = #{params[:id]}").first
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: "blog was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "タイトルを入力してください" }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_path(@blog), notice: "blog was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_path, notice: "blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title)
    end

    def set_data
      @blogs_all = Blog.all
      # Blogのid:1に紐づくすべてのCommentを表示
      entries = Entry.where(blog_id: 1)
      @comments = Comment.where(entry_id: entries.ids)
      # まだEntryを書いていないBlogを表示
      entry_blog_ids = Entry.pluck(:blog_id).uniq
      @blogs = Blog.where.not(id: entry_blog_ids)
      # statusがunapprovedであるCommentがあるEntryのあるBlogを表示
      entry_ids = Comment.where(status: "unapproved").pluck(:entry_id)
      @blogs_2 = Blog.where(id: entry_ids)

      @entries = Entry.where(id: @blogs_all)
    end
end
