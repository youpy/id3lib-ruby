# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "id3lib-ruby"
  s.version = '0.6.0'

  s.authors = ["Robin Stocker"]
  s.summary = "id3lib-ruby provides a Ruby interface to the id3lib C++ library for easily editing ID3 tags (v1 and v2) of MP3 audio files."
  s.description = "= id3lib-ruby\n\nid3lib-ruby provides a Ruby interface to the id3lib C++ library for easily\nediting ID3 tags (v1 and v2) of MP3 audio files.\n\nThe class documentation starts at ID3Lib::Tag.\n\n\n== Features\n\n* Read and write ID3v1 and ID3v2 tags\n* Simple interface for adding, changing and removing frames\n* Quick access to common text frames like title and performer\n* Custom data frames like attached picture (APIC)\n* Pretty complete coverage of id3lib's features\n* UTF-16 support (warning: id3lib writes broken UTF-16 frames)\n* Windows binary gem available\n\nThe CHANGES file contains a list of changes between versions.\n\n\n== Installation\n\nSee INSTALL.\n\n\n== Online Information\n\nThe home of id3lib-ruby is http://id3lib-ruby.rubyforge.org\n\n\n== Usage\n\n  require 'rubygems'\n  require 'id3lib'\n  \n  # Load a tag from a file\n  tag = ID3Lib::Tag.new('talk.mp3')\n  \n  # Get and set text frames with convenience methods\n  tag.title  #=> \"Talk\"\n  tag.album = 'X&Y'\n  tag.track = '5/13'\n  \n  # Tag is a subclass of Array and each frame is a Hash\n  tag[0]\n  #=> { :id => :TPE1, :textenc => 0, :text => \"Coldplay\" }\n  \n  # Get the number of frames\n  tag.length  #=> 7\n  \n  # Remove all comment frames\n  tag.delete_if{ |frame| frame[:id] == :COMM }\n  \n  # Get info about APIC frame to see which fields are allowed\n  ID3Lib::Info.frame(:APIC)\n  #=> [ 2, :APIC, \"Attached picture\",\n  #=>   [:textenc, :mimetype, :picturetype, :description, :data] ]\n  \n  # Add an attached picture frame\n  cover = {\n    :id          => :APIC,\n    :mimetype    => 'image/jpeg',\n    :picturetype => 3,\n    :description => 'A pretty picture',\n    :textenc     => 0,\n    :data        => File.read('cover.jpg')\n  }\n  tag << cover\n  \n  # Last but not least, apply changes\n  tag.update!\n\n\n== Licence\n\nThis library has Ruby's licence:\n\nhttp://www.ruby-lang.org/en/LICENSE.txt\n\n\n== Author\n\nRobin Stocker <robinstocker at rubyforge.org>\n"
  s.email = "robinstocker@rubyforge.org"
  s.homepage = "http://id3lib-ruby.rubyforge.org"
  s.rubyforge_project = "id3lib-ruby"

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extensions    = `git ls-files -- ext/*/extconf.rb`.split("\n")
  s.require_paths = ["lib"]
end
