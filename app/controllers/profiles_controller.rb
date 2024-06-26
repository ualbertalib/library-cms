# frozen_string_literal: true

class ProfilesController < ApplicationController
  $units = {access: "Access Services",
            archives: "Archives",
            bib: "Cataloguing Strategies",
            collections: "Collection Strategies",
            copyright: "Copyright",
            digital: "Digital Production & Preservation Services",
            digrepo: "Digital Repository & Data Services",
            dsc: "Digital Scholarship Centre",
            facilities: "Facilities",
            health: "Faculty Engagement (Health Sciences)",
            science: "Faculty Engagement (Natural + Applied Sciences)",
            humanities: "Faculty Engagement (Social Sciences + Humanities)",
            iss: "Information Services & User Engagement",
            admin: "Library Administration",
            lad: "Library Application Development",
            las: "Library Application Support",
            metadata: "Metadata Strategies",
            open: "Open Publishing & Digitization Services",
            rdm: "Research Data Management",
            researchimpact: "Research Impact",
            its: "Specialized Technical Support",
            special: "Special Collections",
            stratigic: "Strategic Partnerships",
            tl: "Teaching & Learning",
            ux: "User Experience"}
  $buildings = {augustana: "Augustana Campus Library",
                bsj: "Bibliothèque Saint-Jean",
                bpsc: "Bruce Peel Special Collections",
                cameron: "Cameron Library",
                sperber: "Sperber Library",
                rcrf: "Research & Collections Resource Facility",
                rutherford: "Rutherford Library",
                stjosephs: "St. Joseph's Library"}

  # You'll have to define "cmsPassword" in secrets.yml, or this will fail. Thanks, ansible.
  http_basic_authenticate_with name: Rails.application.secrets.cms_user, password: Rails.application.secrets.cms_password, except: [:index, :show]

  def index
    path = request.url
    if path.include? "unit"
      @unit = params[:unit]
      @unitname = $units[params[:unit].to_sym]
      @allunit = Profile.where(unit: @unit)
      @heads = @allunit.where(opt_in: true).order(:last_name)
      @staff = @allunit.where(opt_in: nil).order(:last_name)
      @profiles = @heads + @staff
    elsif path.include? "building"
      @building = params[:building]
      @buildingname = $buildings[params[:building].to_sym]
      @profiles = Profile.where("campus_address=?", params[:building]).order(:first_name)
    else
      @profiles = Profile.order(:first_name)
    end
    respond_to do |format|
      format.html
      format.csv { send_data @profiles.to_csv }
    end
  end

  def show
    @profile = Profile.friendly.find(params[:id])
  end

  def new
    @profile = Profile.new
    @buildings = $buildings
    @units = $units
  end

  def edit
    @profile = Profile.friendly.find(params[:id])
    @buildings = $buildings
    @units = $units
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to @profile
  end

  def update
    @profile = Profile.friendly.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render "edit"
    end
  end

  def destroy
    @profile = Profile.friendly.find(params[:id])
    @profile.destroy

    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :unit, :email, :phone, :campus_address, :expertise, :introduction, :publications, :staff_since, :liason, :links, :orcid, :committees, :personal_interests, :opt_in)
  end
end
