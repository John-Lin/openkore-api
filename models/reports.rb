require 'json'
require 'sequel'

class Report < Sequel::Model
  plugin :timestamps, update_on_create: true
  set_allowed_columns :username

  def to_json(options = {})
    JSON({  type: 'report',
            id: id,
            attributes: {
              username: username,
              char_info: char_info,
              exp_report: exp_report,
              items: items
            }
          })
  end
end
