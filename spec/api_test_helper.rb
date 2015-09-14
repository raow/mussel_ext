module ApiTestHelper
  extend ActiveSupport::Concern

  def attach_auth_info(params = {}, account)
    params[:auth_token] = account.authentication_token
    params[:format] = 'json'
    params
  end

  def get_data(key)
    p @response.body
    p "))))))))))))))"
    JSON.parse(response.body)[key]
  end

  def get_code
    JSON.parse(response.body)["code"]
  end
end