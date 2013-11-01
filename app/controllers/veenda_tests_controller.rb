class VeendaTestsController < ApplicationController
  # GET /veenda_tests
  # GET /veenda_tests.json
  def index
    @veenda_tests = VeendaTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @veenda_tests }
    end
  end

  # GET /veenda_tests/1
  # GET /veenda_tests/1.json
  def show
    @veenda_test = VeendaTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @veenda_test }
    end
  end

  # GET /veenda_tests/new
  # GET /veenda_tests/new.json
  def new
    @veenda_test = VeendaTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @veenda_test }
    end
  end

  # GET /veenda_tests/1/edit
  def edit
    @veenda_test = VeendaTest.find(params[:id])
  end

  # POST /veenda_tests
  # POST /veenda_tests.json
  def create
    @veenda_test = VeendaTest.new(params[:veenda_test])

    respond_to do |format|
      if @veenda_test.save
        format.html { redirect_to @veenda_test, notice: 'Veenda test was successfully created.' }
        format.json { render json: @veenda_test, status: :created, location: @veenda_test }
      else
        format.html { render action: "new" }
        format.json { render json: @veenda_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /veenda_tests/1
  # PUT /veenda_tests/1.json
  def update
    @veenda_test = VeendaTest.find(params[:id])

    respond_to do |format|
      if @veenda_test.update_attributes(params[:veenda_test])
        format.html { redirect_to @veenda_test, notice: 'Veenda test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @veenda_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veenda_tests/1
  # DELETE /veenda_tests/1.json
  def destroy
    @veenda_test = VeendaTest.find(params[:id])
    @veenda_test.destroy

    respond_to do |format|
      format.html { redirect_to veenda_tests_url }
      format.json { head :no_content }
    end
  end
end
