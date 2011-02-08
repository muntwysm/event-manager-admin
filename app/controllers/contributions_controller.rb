class ContributionsController < ApplicationController
  # GET /contributions
  # GET /contributions.xml
  def index
    @results = Contribution.search(params[:search])
		@contributions = @results.paginate :page => params[:page], :per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contributions }
    end
  end

  # GET /contributions/1
  # GET /contributions/1.xml
  def show
    @contribution = Contribution.find(params[:id])
		@event = @contribution.event

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contribution }
    end
  end

  # GET /contributions/new
  # GET /contributions/new.xml
  def new
    @contribution = Contribution.new
		@event = Event.find(params[:id])
		@contribution.event_id = @event.id
		@contribution.email = session[:user_name]
		@requirement = Requirement.find(params[:req_id])
		@contribution.item_id = @requirement.item_id #params[:req_id]
		@requirements = @event.requirements
		@items = Item.all(:joins => :requirements, :conditions => ["event_id = ?", @event.id])
		
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contribution }
    end
  end

  # GET /contributions/1/edit
  def edit
    @contribution = Contribution.find(params[:id])
		@event = @contribution.event
		@old_qty = @contribution.qty
		@contribution.save
  end

  # POST /contributions
  # POST /contributions.xml
  def create
    @contribution = Contribution.new(params[:contribution])
		@event = Event.find(@contribution.event_id)
		session[:user_name] = @contribution.email
		@token = Contribution.find(:all, :conditions => ['authtoken = ?', @contribution.authtoken])

		if @token.count == 0
			if @contribution.save
		  redirect_to(@contribution, :notice => 'Contribution was successfully added.') 
			else
				render :action => "new"
			end
		else
			redirect_to(@event, :alert => 'Form Error: Duplicate form. Use the "Make Contribution" link to make a new contribution.') 
		end
  end

  # PUT /contributions/1
  # PUT /contributions/1.xml
  def update
    @contribution = Contribution.find(params[:id])
		@event = @contribution.event

    respond_to do |format|
      if @contribution.update_attributes(params[:contribution])
        format.html { redirect_to(@contribution, :notice => 'Contribution was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.xml
  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy

    respond_to do |format|
      format.html { redirect_to(@contribution.event) }
      format.xml  { head :ok }
    end
  end
end
