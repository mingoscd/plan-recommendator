require 'rails_helper'

RSpec.describe RegisterController, type: :controller do
 describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "redirects to index if succesfull" do
      post :create, user: { email: "email@email.com", password: "password", password_confirmation: "password" }
      expect(response).to be_success
    end

    it "creates a new user with: CORRECT DATA" do
      post :create, user: { email: "email@email.com", password: "password", password_confirmation: "password" }

      the_user = User.last
      expect(the_user.email).to eq("email@email.com")
      expect(the_user).to be_valid
    end
		it "user register VALIDATIONS: REPEATED EMAIL" do
      User.create(email: "email@email.com", password: "password", password_confirmation: "password") 
      post :create, user: {email: "email@email.com", password: "password", password_confirmation: "password"}
      expect(response).to render_template 'new'
    end
    it "user register VALIDATIONS: INCORRECT PASSWORD" do
      post :create, user: {email: "email@email.com", password: "secretpassword", password_confirmation: "password"}
      expect(response).to render_template 'new'
    end
    it "user register VALIDATIONS: SHORT PASSWORD" do
      post :create, user: {email: "email@email.com", password: "1234", password_confirmation: "1234"}
      expect(response).to render_template 'new'
    end
    #it "send welcome email after cat creation" do
    #   # Ignoring delayed jobs in order to deliver the email
    #   # http://stackoverflow.com/questions/6352333/rails-rspec-testing-delayed-job-mails
    #   Delayed::Worker.delay_jobs = false

    #   post :create, user: { name: "Name", email: "email@email.com", password: "password", password_confirmation: "password" }

    #   last_cat = Cat.last

    #   welcome_email = ActionMailer::Base.deliveries.last
    #   expect(welcome_email.from).to match_array(["catbook@esdeluxe.com"])
    #   expect(welcome_email.to).to match_array([last_cat.email])
    #   expect(welcome_email.subject).to eq("Welcome to CatBook! Miauuuuu")
    #   expect(welcome_email.to_s).to match(/Welcome to CatBook, #{last_cat.name}!/)
    # end

    # it "renders new template if validation errors" do
    #   post :create, user: { email: "email@email.com", password: "password", password_confirmation: "password" }

    #   expect(response).to render_template("new")
    # end
  end
end
