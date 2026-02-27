class AiGeneratorController < ApplicationController
  def description
    @property = Property.find(params[:property_id])
    # Load generated content from session if available
    if session[:generated_description].present?
      gen = session[:generated_description]
      @professional = gen[:professional]
      @whatsapp = gen[:whatsapp]
      @seo = gen[:seo]
    end
  end

  def social_post
    @property = Property.find(params[:property_id])
    # Load generated content from session if available
    if session[:generated_social_post].present?
      gen = session[:generated_social_post]
      @instagram = gen[:instagram]
      @facebook = gen[:facebook]
      @whatsapp_msg = gen[:whatsapp_msg]
      @hashtags = gen[:hashtags]
      Rails.logger.info "=== Loaded from session: #{@instagram.present? ? 'YES' : 'NO'} ==="
    else
      Rails.logger.info "=== No content in session ==="
    end
  end

  def generate_description
    @property = Property.find(params[:property_id])

    # Generate AI-like content using templates
    size = @property.size
    location = @property.colony_name
    amenities = params[:amenities] || "prime location"
    price = @property.price

    @professional = generate_professional_description(size, location, amenities, price)
    @whatsapp = generate_whatsapp_description(size, location, amenities, price)
    @seo = generate_seo_description(size, location, amenities, price)

    respond_to do |format|
      format.turbo_stream
      format.json
      format.html do
        # Store generated content in session
        session[:generated_description] = {
          professional: @professional,
          whatsapp: @whatsapp,
          seo: @seo
        }
        flash[:notice] = "Marketing content generated successfully!"
        redirect_to ai_generator_description_path(property_id: @property.id)
      end
    end
  end

  def generate_social_post
    @property = Property.find(params[:property_id])
    
    Rails.logger.info "=== Generating social post for property #{@property.id} ==="

    @instagram = generate_instagram_caption(@property)
    @facebook = generate_facebook_post(@property)
    @whatsapp_msg = generate_whatsapp_message(@property)
    @hashtags = generate_hashtags(@property)
    
    Rails.logger.info "=== Generated content, storing in session ==="

    respond_to do |format|
      format.turbo_stream
      format.json
      format.html do
        # Store generated content in session
        session[:generated_social_post] = {
          instagram: @instagram,
          facebook: @facebook,
          whatsapp_msg: @whatsapp_msg,
          hashtags: @hashtags
        }
        Rails.logger.info "=== Session stored: #{session[:generated_social_post].keys} ==="
        flash[:notice] = "Social media content generated successfully!"
        redirect_to ai_generator_social_post_path(property_id: @property.id)
      end
    end
  end

  private

  def generate_professional_description(size, location, amenities, price)
    "Discover this exceptional #{size} sq. ft. property located in the prestigious #{location}. 
    This prime real estate opportunity features modern amenities and is positioned in one of the 
    most sought-after locations. With an attractive price point of ₹#{number_to_currency(price)}, 
    this property represents an excellent investment opportunity for discerning buyers."
  end

  def generate_whatsapp_description(size, location, amenities, price)
    "🏡 Prime Property Alert!
    📍 #{location}
    📐 #{size} sq. ft.
    💰 ₹#{number_to_currency(price)}
    ✨ Premium amenities
    📞 Contact us today!"
  end

  def generate_seo_description(size, location, amenities, price)
    "Premium #{size} sq. ft. property for sale in #{location}. 
    Best real estate investment opportunity with modern amenities at ₹#{number_to_currency(price)}. 
    Buy plots in #{location}, prime residential property, luxury real estate investment."
  end

  def generate_instagram_caption(property)
    "✨ Dream Property Alert! ✨

🏡 #{property.title}
📍 #{property.colony_name}
📐 #{property.size} sq. ft.
💰 #{number_to_currency(property.price)}

Your perfect home awaits! 🗝️

#RealEstate #DreamHome #PropertyForSale #Investment #LuxuryLiving"
  end

  def generate_facebook_post(property)
    "🏠 EXCLUSIVE PROPERTY LISTING 🏠

#{property.title} is now available in #{property.colony_name}!

✅ #{property.size} sq. ft. of premium space
✅ Prime location with excellent connectivity
✅ Modern amenities
✅ Great investment opportunity

Price: ₹#{number_to_currency(property.price)}

📞 Contact us today to schedule a viewing!

#RealEstate #PropertyListing #DreamHome"
  end

  def generate_whatsapp_message(property)
    "🏡 *New Property Listing!*

*#{property.title}*
📍 #{property.colony_name}
📐 #{property.size} sq. ft.
💰 *₹#{number_to_currency(property.price)}*

Status: #{property.status.capitalize}

#{property.description}

Interested? Reply for more details! 📞"
  end

  def generate_hashtags(property)
    "#RealEstate #PropertyForSale ##{property.colony_name.gsub(' ', '')} #DreamHome #Investment #LuxuryLiving #RealEstateInvestment #PropertyListing #HomeSweetHome #PrimeLocation"
  end

  def number_to_currency(number)
    ActionController::Base.helpers.number_with_delimiter(number, delimiter: ',')
  end
end
