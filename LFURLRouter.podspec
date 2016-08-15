Pod::Spec.new do |spec|
    spec.name                  = 'LFURLRouter'
    spec.version               = '1.0.5'
    spec.summary               = 'URL Router inspired by PonyRouter'

    spec.description           = <<-DESC
                               URL Router inspired by PonyRouter.
                               DESC

    spec.homepage              = 'https://github.com/pgbo/LFURLRouter.git'
    spec.license               = { :type => 'MIT', :file => 'LICENSE' }
    spec.author                = { 'guangbool' => '460667915@qq.com' }
    spec.social_media_url      = 'https://twitter.com/guangbool'
    spec.platform              = :ios, '5.0'
    spec.source                = { :git => 'https://github.com/pgbo/LFURLRouter.git', :tag => spec.version }
    spec.source_files          = 'LFURLRouter/**/*.{h,m}'
    spec.requires_arc          = true
    spec.frameworks            = 'Foundation'

end