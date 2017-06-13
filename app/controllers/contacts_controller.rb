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
            redirect_to contacts_path
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

    def photo
        @contact = Contact.find(params[:id])

        if @contact.update(photo: params[:contact][:photo])
            redirect_to @contact
        else
            render 'show'
        end
    end

    def search
        @contacts = Contact.search(params[:q])

        render 'index'
    end
    
    private
        def contact_params
            params.require(:contact).permit(:firstname, :lastname, :birthday, :email, :phone, :address, :photo)
        end

        def upload
            uploaded_io = params[:contact][:photo]
            File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
                file.write(uploaded_io.read)
            end
        end

        def set_photo contact
            if contact.photo.nil? || contact.photo.empty?
                contact.photo = "contact/default.png"
            else
                contact.photo = "contact/" + contact.id + "/" + contact.photo
            end
        end

end
