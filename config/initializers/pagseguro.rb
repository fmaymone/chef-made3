PagSeguro.configure do |config|
  puts "PASSOU PELA CONFIGURACAO"
  config.token       = "F45C5DCD202E4BC797600167B07724AB"
  config.email       = "fmaymone@gmail.com"
  config.environment = :production # ou :sandbox. O padrão é production.
  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
end