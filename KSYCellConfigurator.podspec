
Pod::Spec.new do |s|
  s.name         = "KSYCellConfigurator"
  s.version      = "1.0"
  s.summary      = "UITableViewCell Configurator"
  s.description  = "🚀 The quickest way to rapid customization of UITableView with some cells."
  s.homepage     = "https://github.com/huangdaxiaEX/TableViewCellConfigurator"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "huangdaxia" => "527548875@qq.com" }
  s.source       = { :git => "https://github.com/huangdaxiaEX/TableViewCellConfigurator.git", :tag => "#{s.version}" }
  s.source_files = "TableViewCellConfigurator/TableViewCellConfigurator/CellConfigurator/*.{swift}"

  s.ios.deployment_target = '8.0'
end
