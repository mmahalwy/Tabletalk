module UserTaggable
  include ActiveSupport::Concern

  INTERESTED_IN_MEETING = {
    FOUNDERS: 'founders',
    MARKETING: 'marketing',
    SALES: 'sales',
    PRODUCT_MANAGERS: 'product_managers',
    DESIGNERS: 'designers',
    DEVELOPERS: 'developers',
    INVESTORS: 'investors',
    HIRING_MANAGERS: 'hiring_managers',
    OTHER: 'other',
    ANYONE: 'anyone',
  }

  INTERESTED_IN_MEETING_LABELS = {
    INTERESTED_IN_MEETING[:FOUNDERS] => 'Founders',
    INTERESTED_IN_MEETING[:MARKETING] => 'Marketing',
    INTERESTED_IN_MEETING[:SALES] => 'Sales',
    INTERESTED_IN_MEETING[:PRODUCT_MANAGERS] => 'Product Managers',
    INTERESTED_IN_MEETING[:DESIGNERS] => 'Designers',
    INTERESTED_IN_MEETING[:DEVELOPERS] => 'Developers',
    INTERESTED_IN_MEETING[:INVESTORS] => 'Investors',
    INTERESTED_IN_MEETING[:HIRING_MANAGERS] => 'Hiring Managers',
    INTERESTED_IN_MEETING[:OTHER] => 'Other',
    INTERESTED_IN_MEETING[:ANYONE] => 'Anyone',
  }
end
