class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

  def show_ruby
    @portfolio_items = Portfolio.show_only_ruby
  end

	def new
		@portfolio_item = Portfolio.new

    #'build' function simply instantiate nested attribute technologies during 'new' function of portfolio item
    3.times { @portfolio_item.technologies.build }
	end

	def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:title]))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def update
  	@portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
  	@portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy

    # This code below just simply redirecting after performed above destruction.
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Successfully Deleted!' }
    end
  end

end

