class OpenKoreAPI < Sinatra::Base
  get '/api/v1/all/users' do
    protected!
    content_type 'application/json'

    begin
      users = []
      all_report = Report.all
      all_report.each{|r| users << r.username}
      { :users => users, :count => users.count }.to_json
    rescue => e
      logger.info "FAILED to get All users: #{e.inspect}"
      status 404
    end
  end
end
