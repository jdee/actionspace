require_relative "actionspace"

module ActionSpace
  class ActionSpaceError < RuntimeError; end
  class ActionSpaceNotFound < ActionSpaceError; end
  class InvalidImport < ActionSpaceError; end

  module DSL
    # Define an ActionSpace with actions (in a plugin, e.g.)
    # @param [#to_sym] name Name of the ActionSpace to create
    def actionspace(name, options = {}, &b)
      as = options.delete(:as)
      import = options.delete(:import)

      space = ActionSpace[name] || ActionSpace.new(name, options)
      yield space if block_given?
      import_actionspace(name, as: as) if import
      space
    end

    # Import an ActionSpace into the current context
    # @param [#to_sym] name Name of the ActionSpace to import
    def import_actionspace(name, as: nil)
      raise ArgumentError, "name may not be nil" if name.nil?

      # 1. Find the ActionSpace by name
      space = ActionSpace[name]
      raise ActionSpaceNotFound, "ActionSpace #{name} not found" if space.nil?

      # 2. Store the runner context
      raise InvalidImport, "No Fastlane runner context available" unless respond_to?(:runner)
      space.runner = runner

      # 3. Define a method to get the ActionSpace.
      self.class.send :define_method, (as || name).to_sym do
        space
      end

      space
    end

    alias namespace actionspace
    alias import_namespace import_actionspace
  end
end
