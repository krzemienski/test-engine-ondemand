class PresetTemplatesController < ApplicationController
  def index
    @preset_templates = PresetTemplate.all
  end
  
  def new
    @preset_template = PresetTemplate.new
  end
  
  def create
    @preset_template = PresetTemplate.new(user_params)
    if @preset_template.save
      flash[:notice] = "Preset template created."
      redirect_to preset_templates_path
    else
      flash[:alert] = "Unable to create preset template."
      render :new
    end
  end
  
  def destroy
    @preset_template = PresetTemplate.find(params[:id])
    if @preset_template.destroy
      flash[:notice] = "Preset template removed."
    else
      flash[:alert] = "Unable to remove preset template."
    end
    redirect_to preset_templates_path
  end
  
  private
  
  def user_params
    params.require(:preset_template).permit(:preset_type, :template_text)
  end
end
