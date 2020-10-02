class Rules
  def self.rules
    all_rules = {
      A: {
          condition_method: :%,
          condition: 3,
          discount: 15,
        },

      B: {
          condition_method: :%,
          condition: 2,
          discount: 5,
        },

      total: {
          condition_method: :>,
          condition: 150,
          discount: 20,
          operation: :-
        }
      }

        rules = all_rules
      end
end