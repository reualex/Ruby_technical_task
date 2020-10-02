class Rules
  def self.rules
all_rules = {
  A: {
      condition_method: :%,
      condition: 3,
      discount: 15,
      operation: :-
    },

  B: {
      condition_method: :%,
      condition: 2,
      discount: 5,
      operation: :-
    },

  total: {
      condition_method: :>,
      condition: 150,
      discount: 20,
      operation: :-
    }
  }

    rules = check_rules(all_rules)
  end

  def self.check_rules(rules)
    error ||= ""
    rules.values.each do |rule|
      rule.values.each do |v|
        if v.nil?
          error += "Rule '#{rules.key(rule)}' has an a error. "
        end
      end
    end

    if error.empty?
      return rules
    else
      rules.clear()
      return rules = {error: error}
    end
  end

  def self.test_rules
    all_rules = {
      A: {
          condition_method: :%,
          condition: 3,
          discount: nil,
          operation: :-
        },

      B: {
          condition_method: :%,
          condition: 2,
          discount: 5,
          operation: :-
        },

      total: {
          condition_method: :>,
          condition: nil,
          discount: 20,
          operation: :-
        }
      }

        rules = check_rules(all_rules)
      end

      def self.check_rules(rules)
        error ||= ""
        rules.values.each do |rule|
          rule.values.each do |v|
            if v.nil?
              error += "Rule '#{rules.key(rule)}' has an a error. "
            end
          end
        end

        if error.empty?
          return rules
        else
          rules.clear()
          return rules = {error: error}
        end
      end
end

