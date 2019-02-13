module ApplicationHelper
  def site_brand_name
    'Tabletalk'
  end

  def site_home_image
    'https://images.unsplash.com/photo-1529022805552-1c88a713c1c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80'
  end

  def site_description
    'Meet, learn and grow. Every week, you will be matched with business professionals in your community for a cup of coffee.'
  end

  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def home_path?
    current_page?('/')
  end
end
