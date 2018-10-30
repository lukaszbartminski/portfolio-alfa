class PortfoliosController < ApplicationController
  layout "portfolio"
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  access all: [:show_ruby, :index, :show], user: {except: [:destroy, :new, :edit, :create, :update, :sort]}, site_admin: :all
  
	def index
		@portfolio_items = Portfolio.by_position
	end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def show_ruby
    @portfolio_items = Portfolio.show_only_ruby
  end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy

    @portfolio_item.destroy

    # This code below just simply redirecting after performed above destruction.
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Successfully Deleted!' }
    end
  end

  #######
  private
  #######
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle, 
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :title, :_destroy]
                                      )
  end

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

end

