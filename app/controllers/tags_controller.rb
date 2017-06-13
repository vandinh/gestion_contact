class TagsController < ApplicationController
    
  def create
  	@contact = Contact.find(params[:contact_id])
    @tag = @contact.tags.create(tag_params)

    redirect_to contact_path(@contact)
  end

  private
  	def tag_params
  		params.require(:tag).permit(:name)
  	end
end
