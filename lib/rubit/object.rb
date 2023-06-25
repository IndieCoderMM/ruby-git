require 'fileutils'

module Rubit
    RUBIT_DIR = "#{Dir.pwd}/.rubit".freeze
    OBJECTS_DIR = "#{RUBIT_DIR}/objects".freeze 

    class Object    
        def initialize(sha)
            @sha = sha
        end

        def write(&block)
            object_dir = "#{OBJECTS_DIR}/#{sha[0..1]}"
            FileUtils.mkdir_p object_dir
            object_path = "#{object_dir}/#{sha[2..-1]}"
            File.open(object_path, 'w', &block)
        end

        attr_reader :sha 
    end
end