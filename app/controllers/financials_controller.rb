class FinancialsController < ApplicationController
  # GET /financials
  # GET /financials.json

  def airbnb
    @financial = Financial.new

    @apt = Financial.last

    @rent = params[:rent]



  end


  def index
    @financials = Financial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @financials }
    end
  end

  # GET /financials/1
  # GET /financials/1.json
  def show
    @financial = Financial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @financial }
    end
  end

  # GET /financials/new
  # GET /financials/new.json
  def new
    @financial = Financial.new
    @financials = Financial.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @financial }
    end
  end

  # GET /financials/1/edit
  def edit
    @financial = Financial.find(params[:id])
  end

  # POST /financials
  # POST /financials.json
  def create
    @financial = Financial.new(params[:financial])

    respond_to do |format|
      if @financial.save
        format.html { redirect_to airbnb_path, notice: 'Financial was successfully created.' }
        format.json { render json: @financial, status: :created, location: @financial }
      else
        format.html { render action: "new" }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /financials/1
  # PUT /financials/1.json
  def update
    @financial = Financial.find(params[:id])

    respond_to do |format|
      if @financial.update_attributes(params[:financial])
        format.html { redirect_to @financial, notice: 'Financial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financials/1
  # DELETE /financials/1.json
  def destroy
    @financial = Financial.find(params[:id])
    @financial.destroy

    respond_to do |format|
      format.html { redirect_to financials_url }
      format.json { head :no_content }
    end
  end
end
