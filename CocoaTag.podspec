Pod::Spec.new do |s|
   s.name         = "CocoaTag"
   s.version      = "0.1.1"
   s.summary      = "The package of useful tools, include categories and classes"
   s.homepage     = "https://github.com/thebookofleaves/CocoaTags"
   s.license      = "MIT"
   s.authors      = { 'Cocoa Lee' => 'cocoaleespring@gmail.com'}
   s.platform     = :ios, "7.0"
   s.source       = { :git => "https://github.com/thebookofleaves/CocoaTags.git", :tag => s.version }
   s.source_files = 'CocoaTag/CocoaTag/CocoaTag*.{h,m}'
   s.requires_arc = true end
