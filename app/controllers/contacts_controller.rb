class ContactsController < ApplicationController

    def index
        @contacts = Contact.all
    end

    def show
        @contact = Contact.find(params[:id])
    end

    def create
        @contact = Contact.new(contact_params)
 
        if @contact.save
            redirect_to @contact
        else
            render 'new'
        end
    end

    def new
        @contact = Contact.new
    end

    def update
        @contact = Contact.find(params[:id])
 
        if @contact.update(contact_params)
            redirect_to @contact
        else
            render 'edit'
        end
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy
    
        redirect_to contacts_path
    end

    def add_photo
        @contact = Contact.find(params[:contact_id])

        if @contact.update(photo: params[:photo])            
            redirect_to @contact
        else
            render 'add_photo'
        end
    end

    def add_tags
        @contact = Contact.find(params[:contact_id])

        if @contact.update(photo: params[:name])            
            redirect_to @contact
        else
            render 'add_tags'
        end
    end

    def search
        tags = params[:tags]
        tags.each do |tag|

        end
        @contact = Contact.includes(:tags).where(tags: {name: tag})

        @contact.each do |
    end
    
    private
        def contact_params
            params.require(:contact).permit(:firsname, :lastname, :birthday, :address, )
        end

end
