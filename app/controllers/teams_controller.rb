# frozen_string_literal: true

class TeamsController < ApplicationController
  require_module_enabled! :team
  load_resource find_by: :login
  load_and_authorize_resource

  before_action :set_team, only: %i[show edit update destroy]

  def index
    @total_team_count = Company.count
    @active_teams = Company.fields_for_list.hot.limit(60)
  end

  def show
    redirect_to user_path(params[:id])
  end

  def new
    @team = Company.new
  end

  def create
    @team = Company.new(team_params)
    @team.owner_id = current_user.id
    if @team.save
      redirect_to(edit_company_path(@team), notice: "创建成功")
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to(edit_company_path(@team), notice: t("common.update_success"))
    else
      # 转向正确的拼写
      @team.login = @team.login_was || @team.login
      render action: "edit"
    end
  end

  private

  def team_params
    params.require(:team).permit(:login, :name, :email, :email_public, :bio, :website, :twitter, :github, :location, :avatar)
  end

  def set_team
    @team = Company.find_by_login!(params[:id])
  end
end
