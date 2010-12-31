class WhishlistsController < ApplicationController
  # GET /whishlists
  # GET /whishlists.xml
  def index
    @whishlists = Whishlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @whishlists }
    end
  end

  # GET /whishlists/1
  # GET /whishlists/1.xml
  def show
    @whishlist = Whishlist.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @whishlist }
    end
  end

  # GET /whishlists/new
  # GET /whishlists/new.xml
  def new
    @whishlist = Whishlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @whishlist }
    end
  end

  # GET /whishlists/1/edit
  def edit
    @whishlist = Whishlist.get(params[:id])
  end

  # POST /whishlists
  # POST /whishlists.xml
  def create
    @whishlist = Whishlist.new(params[:whishlist])

    respond_to do |format|
      if @whishlist.save
        format.html { redirect_to(whishlists_url, :notice => 'Movie name added to wishlist.') }
        format.xml  { render :xml => @whishlist, :status => :created, :location => @whishlist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @whishlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /whishlists/1
  # PUT /whishlists/1.xml
  def update
    @whishlist = Whishlist.get(params[:id])

    respond_to do |format|
      if @whishlist.update(params[:whishlist])
        format.html { redirect_to(@whishlist, :notice => 'Whishlist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @whishlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /whishlists/1
  # DELETE /whishlists/1.xml
  def destroy
    @whishlist = Whishlist.get(params[:id])
    @whishlist.destroy

    respond_to do |format|
      format.html { redirect_to(whishlists_url) }
      format.xml  { head :ok }
    end
  end
end
