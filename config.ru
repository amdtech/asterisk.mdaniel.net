
require 'toto'
# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

require 'rack-rewrite'
use Rack::Rewrite do
  r301 %r{/^(?:\?p=|archives/)3$}, '/2006/10/09/internet2-voip-sig'
  r301 %r{/^(?:\?p=|archives/)5$}, '/2006/10/11/volgain-patch-for-asterisk-v12'
  r301 %r{/^(?:\?p=|archives/)7$}, '/2006/10/13/voicemail-app-modifications'
  r301 %r{/^(?:\?p=|archives/)10$}, '/2006/10/16/an-ongoing-battle-which-phone-is-better'
  r301 %r{/^(?:\?p=|archives/)11$}, '/2006/10/29/polycom-vs-cisco'
  r301 %r{/^(?:\?p=|archives/)12$}, '/2006/11/08/fonality-vs-digium'
  r301 %r{/^(?:\?p=|archives/)13$}, '/2006/12/04/conversion-blues'
  r301 %r{/^(?:\?p=|archives/)14$}, '/2006/12/06/mwi-notification'
  r301 %r{/^(?:\?p=|archives/)15$}, '/2006/12/13/need-ideas'
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  set :author,    "Aaron Daniel"                              # blog author
  set :title,     "mDaniel.net Asterisk Blog"                 # site title
  # set :root,      "index"                                   # page to load on /
  # set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  set :markdown,  :smart                                      # use markdown + smart-mode
  set :disqus,    "asterisk-mdaniel"                          # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds

  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto


