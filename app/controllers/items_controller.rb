class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :stockupdate]

  # GET /items
  # GET /items.json
  def index
    @categories = Category.all
    if params[:sortype] == "expensive"
      expensive
    elsif params[:sortype] == "cheapest"
      cheapest
    elsif params[:sortype] == "bestrated"
      bestrated
    elsif params[:sortype] == "lowestrated"
      lowestrated
    else
      if params[:category_filter].nil? || params[:category_filter] == "All"
       @items = Item.all
      else
        @items = Item.all.where(category: params[:category_filter])
      end
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @review = Review.new
    @review.item_id = @item.id

  end
  
  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_url, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
def expensive
  if params[:category_filter].nil? || params[:category_filter] == "All"
    @items = Item.expensive
  else
    @filter = params[:category_filter]
    @items = Item.expensive.where(category: @filter)
  end
  render action: :index
end

def cheapest
  if params[:category_filter].nil? || params[:category_filter] == "All"
    @items = Item.cheapest
  else
    @filter = params[:category_filter]
    @items = Item.cheapest.where(category: @filter)
  end
  render action: :index
end

def bestrated
  if params[:category_filter].nil? || params[:category_filter] == "All"
    @items = Item.bestrated
  else
    @filter = params[:category_filter]
    @items = Item.bestrated.where(category: @filter)
  end
  render action: :index
end

def lowestrated
  if params[:category_filter].nil? || params[:category_filter] == "All"
    @items = Item.lowestrated
  else
    @filter = params[:category_filter]
    @items = Item.lowestrated.where(category: @filter)
  end
  render action: :index
end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def search
    @search_criteria =""
    if params[:q].eql? ""
      @search_criteria ="All"
      @items = Item.all
    else
      st = "%#{params[:q]}%"
      # enable this for heroku
      #@items = Item.where("title ILIKE ?", st)
      
      # enable this for sqlite3
      @items = Item.where("title LIKE ?", st)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :author, :description, :price, :image_url, :category, :stock,:category_filter)
    end
end
