class CommitsController < ApplicationController
  before_filter :authenticate_author!, :only => [ :edit, :destroy, :create ]
  before_filter :is_owner , :only => [ :edit , :update ]
  # GET /commits
  # GET /commits.xml

  def index
    @commits = Commit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commits }
    end
  end

  # GET /commits/1
  # GET /commits/1.xml
  def show
    @commit = Commit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @commit }
    end
  end

  # GET /commits/new
  # GET /commits/new.xml
  def new
    @commit = Commit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @commit }
    end
  end

  # GET /commits/1/edit
  def edit
    @commit = Commit.find(params[:id])
  end

  # POST /commits
  # POST /commits.xml
  def create
    @commit = Commit.new(params[:commit_entry])

    respond_to do |format|
      if @commit.save
        format.html { redirect_to(@commit, :notice => 'Commit was successfully created.') }
        format.xml  { render :xml => @commit, :status => :created, :location => @commit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commits/1
  # PUT /commits/1.xml
  def update
    @commit = Commit.find(params[:id])

    respond_to do |format|
      if @commit.update_attributes(params[:commit_entry])
        format.html { redirect_to(@commit, :notice => 'Commit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commits/1
  # DELETE /commits/1.xml
  def destroy
    @commit = Commit.find(params[:id])
    @commit.destroy

    respond_to do |format|
      format.html { redirect_to(commits_url) }
      format.xml  { head :ok }
    end
  end
  def is_owner
    if(current_author != Author.find(params[:id]))
      redirect_to (root_path , :notice => 'Prohibited')
    end
  end
end
