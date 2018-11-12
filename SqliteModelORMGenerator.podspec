#
#  Be sure to run `pod spec lint SqliteModelORMGenerator.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "SqliteModelORMGenerator"
s.version      = "0.0.6"
s.summary      = "SqliteModelORMGenerator help use sqlite with ORM(Object Relational Mapping)"

s.description  = <<-DESC
covert oc model into Sqlite ORM Entity code in xcode log console.then you can copy this code in .m file,then you can use the class functions(createTable+deleteTable+selectWhere+selectAll+insertWithObject(s)+updateWithObject(s)) to perform your persistence actions with sqlite)
DESC

s.homepage     = "https://github.com/FuLingTaiHexiaoke/SqliteModelORMGenerator"

s.license      = { :type => "MIT"}

s.author             = { "xiaoke" => "fighttime@sina.cn" }

s.platform     = :ios

s.source       = { :git => "https://github.com/FuLingTaiHexiaoke/SqliteModelORMGenerator.git", :tag => "#{s.version}" }

s.source_files  = "SqliteModelORMGenerator/*.{h,m}"

s.exclude_files = "Classes/Exclude"

s.resource  = "SqliteModelORMGenerator/*.{xib}"

s.requires_arc = true

s.dependency "FMDB", "~> 2.7.5"

end
