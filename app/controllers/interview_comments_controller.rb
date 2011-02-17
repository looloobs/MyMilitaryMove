class InterviewCommentsController < ApplicationController
  # GET /interview_comments
  # GET /interview_comments.xml
  def index
    @interview_comments = InterviewComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interview_comments }
    end
  end

  # GET /interview_comments/1
  # GET /interview_comments/1.xml
  def show
    @interview_comment = InterviewComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interview_comment }
    end
  end

  # GET /interview_comments/new
  # GET /interview_comments/new.xml
  def new
    @interview_comment = InterviewComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interview_comment }
    end
  end

  # GET /interview_comments/1/edit
  def edit
    @interview_comment = InterviewComment.find(params[:id])
  end

  # POST /interview_comments
  # POST /interview_comments.xml
  def create
    @interview_comment = InterviewComment.new(params[:interview_comment])

    respond_to do |format|
      if @interview_comment.save
        flash[:notice] = 'InterviewComment was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @interview_comment, :status => :created, :location => @interview_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interview_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interview_comments/1
  # PUT /interview_comments/1.xml
  def update
    @interview_comment = InterviewComment.find(params[:id])

    respond_to do |format|
      if @interview_comment.update_attributes(params[:interview_comment])
        flash[:notice] = 'InterviewComment was successfully updated.'
        format.html { redirect_to(@interview_comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interview_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_comments/1
  # DELETE /interview_comments/1.xml
  def destroy
    @interview_comment = InterviewComment.find(params[:id])
    @interview_comment.destroy

    respond_to do |format|
      format.html { redirect_to(interview_comments_url) }
      format.xml  { head :ok }
    end
  end
end
