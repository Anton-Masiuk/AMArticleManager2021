Pod::Spec.new do |s|
  s.name             = 'AMArticleManager2021'
  s.version          = '0.1.1'
  s.summary          = 'Article manager'
	s.author           = { 'Anton Masiuk' => 'anton.masiuk@codeit.pro' }
  s.homepage         = 'https://github.com/Anton-Masiuk/AMArticleManager2021'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/Anton-Masiuk/AMArticleManager2021.git', :tag => s.version.to_s }
	
  s.ios.deployment_target = '12.0'
  s.source_files = 'AMArticleManager2021/**/*.swift'
	s.resources = 'AMArticleManager2021/**/*/Article.xcdatamodeld'
	s.frameworks = 'CoreData', 'UIKit'
	s.swift_versions = '5'
end
