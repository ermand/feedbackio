class Users::CompaniesController < Users::BaseController
  before_action :find_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.order("created_at DESC")
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_path, notice: "Company successfully created. #{undo_link}"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Company successfully updated. #{undo_link}"
    else
      render 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, notice: "Company was deleted. #{undo_link}"
  end

  private
    def company_params
      params.require(:company).permit(:name, :state)
    end

    def find_company
      @company = Company.find(params[:id])
    end

    def undo_link
      undo_link = view_context.link_to("undo", revert_version_path(@company.versions.last), method: :post, class: "btn btn-default")
    end
end
