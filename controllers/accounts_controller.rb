# OpenKore Web Service
class OpenKoreAPI < Sinatra::Base

  post '/api/v1/account' do
    protected!
    begin
      data = JSON.parse(request.body.read)
      report = Report.where(username: data['username']).first

      if report.nil?
        saved_account = Report.create(data)
      else
        # record already existed
        halt 409
      end

    rescue => e
      logger.info "FAILED to create new account: #{e.inspect}"
      halt 400
    end
    # puts saved_char_info
    status 201
  end

  delete '/api/v1/account' do
    protected!
    begin
      data = JSON.parse(request.body.read)
      report = Report.where(username: data['username']).first

      if report.nil?
        # record not found
        halt 404
      else
        report.delete
      end

    rescue => e
      logger.info "FAILED to create new account: #{e.inspect}"
      halt 400
    end
    status 204
  end

end
