module ApiHelper
  CODE_AND_MESSAGE = {
    "9999" => "Token已经过期.",
    "9998" => "Token不能为空.",
    "9989" => "用户名和密码都不能为空.",
    "9988" => "找不到该用户.",
    "9987" => "密码错误.",
    "8999" => "找不到请求的数据.",
    "0000" => "成功."
  }

  def message_of_code(code)
    CODE_AND_MESSAGE[code]
  end
end