# OpenKore Web Service
class OpenKoreAPI < Sinatra::Base

  get '/api/v1/all/report/:username' do
    content_type 'application/json'

    begin

      report = Report.where(username: params[:username]).first

      JSON.pretty_generate(char_info: report.char_info,
                           exp_report: report.exp_report,
                           items_info: report.items)
    rescue => e
      logger.info "FAILED to get All report information: #{e.inspect}"
      status 404
    end
  end

  post '/api/v1/char_info' do
    protected!
    begin
      data = JSON.parse(request.body.read)

      report = Report.where(username: data['username']).first
      report.char_info = data['char_info']
      report.save
    rescue => e
      logger.info "FAILED to update char_info: #{e.inspect}"
      halt 400
    end
    # puts saved_char_info
    status 201
  end

  # get '/api/v1/char_info/:username' do
  #   content_type 'application/json'
  #
  #   begin
  #
  #     report = Report.where(username: params[:username]).first
  #
  #     JSON.pretty_generate(char_info: report.char_info)
  #     # logger.info "/api/v1/char_info/:username OK"
  #
  #     # message = JSON.parse(request.body.read)
  #     # base64_msg = Base64.strict_encode64(File.read(log_path + log_name))
  #     #
  #     # { :data => base64_msg }.to_json
  #   rescue => e
  #     logger.info "FAILED to get information Report: #{e.inspect}"
  #     status 404
  #   end
  # end

  post '/api/v1/exp_report' do
    protected!
    begin
      data = JSON.parse(request.body.read)
      # puts data
      report = Report.where(username: data['username']).first
      report.exp_report = data['exp_report']
      report.save
    rescue => e
      logger.info "FAILED to update exp_report: #{e.inspect}"
      halt 400
    end
    status 201
  end

  # get '/api/v1/exp_report/:username' do
  #   content_type 'application/json'
  #
  #   begin
  #     logger.info "/api/v1/exp_report/:username OK"
  #     # message = JSON.parse(request.body.read)
  #     # base64_msg = Base64.strict_encode64(File.read(log_path + log_name))
  #     #
  #     # { :data => base64_msg }.to_json
  #   rescue => e
  #     logger.info "FAILED to get Exp Report: #{e.inspect}"
  #     status 404
  #   end
  # end

  post '/api/v1/items' do
    protected!
    begin
      data = JSON.parse(request.body.read)
      # puts data
      report = Report.where(username: data['username']).first
      report.items = data['items']
      report.save
    rescue => e
      logger.info "FAILED to update items: #{e.inspect}"
      halt 400
    end
    status 201
  end

  # get '/api/v1/items/:username' do
  #   content_type 'application/json'
  #
  #   begin
  #     logger.info "/api/v1/items/:username OK"
  #     # message = JSON.parse(request.body.read)
  #     # base64_msg = Base64.strict_encode64(File.read(log_path + log_name))
  #     #
  #     # { :data => base64_msg }.to_json
  #   rescue => e
  #     logger.info "FAILED to get items information: #{e.inspect}"
  #     status 404
  #   end
  # end

end
