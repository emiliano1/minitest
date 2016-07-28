module PersonConcern
  extend ActiveSupport::Concern

  US_STATES = {
    'AL' => 'Alabama',
    'AK' => 'Alaska',
    'AZ' => 'Arizona',
    'AR' => 'Arkansas',
    'CA' => 'California',
    'CO' => 'Colorado',
    'CT' => 'Connecticut',
    'DE' => 'Delaware',
    'DC' => 'District of Columbia',
    'FL' => 'Florida',
    'GA' => 'Georgia',
    'HI' => 'Hawaii',
    'ID' => 'Idaho',
    'IL' => 'Illinois',
    'IN' => 'Indiana',
    'IA' => 'Iowa',
    'KS' => 'Kansas',
    'KY' => 'Kentucky',
    'LA' => 'Louisiana',
    'ME' => 'Maine',
    'MD' => 'Maryland',
    'MA' => 'Massachusetts',
    'MI' => 'Michigan',
    'MN' => 'Minnesota',
    'MS' => 'Mississippi',
    'MO' => 'Missouri',
    'MT' => 'Montana',
    'NE' => 'Nebraska',
    'NV' => 'Nevada',
    'NH' => 'New Hampshire',
    'NJ' => 'New Jersey',
    'NM' => 'New Mexico',
    'NY' => 'New York',
    'NC' => 'North Carolina',
    'ND' => 'North Dakota',
    'OH' => 'Ohio',
    'OK' => 'Oklahoma',
    'OR' => 'Oregon',
    'PA' => 'Pennsylvania',
    'PR' => 'Puerto Rico',
    'RI' => 'Rhode Island',
    'SC' => 'South Carolina',
    'SD' => 'South Dakota',
    'TN' => 'Tennessee',
    'TX' => 'Texas',
    'UT' => 'Utah',
    'VT' => 'Vermont',
    'VA' => 'Virginia',
    'WA' => 'Washington',
    'WV' => 'West Virginia',
    'WI' => 'Wisconsin',
    'WY' => 'Wyoming'
  }.freeze

  VALID_STATES = US_STATES.keys.freeze

  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] <<
          (options[:message] || "is not a valid email address")
      end
    end
  end

  class ZipCodeValidator< ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /^\d{5}(-\d{4})?$/
        record.errors[attribute] <<
          (options[:message] || "is not a valid zip code")
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def state_name
    US_STATES[state]
  end

  included do
    validates :email, presence: true, email: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    validates :street, presence: true
    validates :city, presence: true
    validates :state, presence: true, inclusion: { in: VALID_STATES,
                                                   message: "is not a US State"}
    validates :zip, presence: true, zip_code: true
  end
end
