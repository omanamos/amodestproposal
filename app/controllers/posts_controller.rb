class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
	@post.views += 1;
	@post.save
	
	@comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(:action => "index", :notice => 'Post was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def create_comment
	params[:comment][:post] = Post.find(Integer(params[:comment][:post]))
  	comment = Comment.new(params[:comment])
  	respond_to do |format|
      if comment.save
        format.html { redirect_to(:action => "show", :id => comment.post.id, :notice => 'Comment was successfully added.') }
      else
        format.html { redirect_to(:action => "show", :id => comment.post.id, :notice => 'Comment could not be added.') }
      end
    end  	
  end
end
