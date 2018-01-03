module ActionSpace
  class ActionSpace
    class << self
      def [](name)
        @spaces ||= {}
        @spaces[name.to_sym]
      end

      def []=(name, actionspace)
        @spaces[name.to_sym] = actionspace
      end
    end

    attr_reader :name
    attr_accessor :runner
    attr_accessor :actions

    def initialize(name, actions)
      @name = name
      @actions = actions
      ActionSpace[name] = self
    end

    def action(name, action_name)
      actions[name.to_sym] = action_name.to_sym
    end

    def [](name)
      actions[name.to_sym]
    end

    def []=(name, action_name)
      action(name, action_name)
    end

    def method_missing(method_sym, *args, &b)
      action_sym = actions[method_sym]
      return super unless action_sym && runner

      # now trigger the action on the runner
      runner.trigger_action_by_name(action_sym, nil, false, *args)
    end
  end
end
